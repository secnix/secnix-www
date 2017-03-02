#!/usr/bin/env sh
#
# secnix.com is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# secnix.com is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with secnix.com.  If not, see <http://www.gnu.org/licenses/>.
#
# This script is used for provisioning a RHEL7 or CentOS7 host to run
# the www.secnix.com website. 
#
# Author: Justin Cook <jhcook@secnix.com>

set -o nounset
set -o errexit
set -x

cleanup() {
  yum clean all
}

prepare_centos() {
  yum install -y centos-release-scl
}

prepare_rhel() {
  subscription-manager repos --enable="rhel-7-server-extras-rpms"
  subscription-manager repos --enable="rhel-server-rhscl-7-rpms"
}

# Ensure this is a supported platform
source /etc/os-release
if [ ${VERSION_ID%.*} -ge 7 ]
then
  if [ "$NAME" == "CentOS Linux" ]
  then
    prepare_centos
  elif [ "$NAME" == "Red Hat Enterprise Linux Server" ]
  then
    prepare_rhel
  else
    printf "This is an unsupported platform\n" 1>&2
    exit 1
  fi
else
  printf "This is an usupported platform\n" 1>&2
  exit 1
fi

# Catch errors and gracefully exit
trap cleanup EXIT INT TERM

# Disable SELinux on the development host
sed -i 's/SELINUX=enforcing/SELINUX=permissive/' /etc/selinux/config
setenforce 0

# Ensure the familiar interface names are used
grep net.ifnames /etc/default/grub && grep biosdevname /etc/default/grub || \
{ sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"/' /etc/default/grub && \
  grub2-mkconfig -o /boot/grub2/grub.cfg ; }
mv /etc/sysconfig/network-scripts/ifcfg-enp0s3 /etc/sysconfig/network-scripts/ifcfg-eth0 || /bin/true
mv /etc/sysconfig/network-scripts/ifcfg-enp0s8 /etc/sysconfig/network-scripts/ifcfg-eth1 || /bin/true
sed -i 's/DEVICE=.*/DEVICE="eth0"/' /etc/sysconfig/network-scripts/ifcfg-eth0
sed -i 's/NAME=.*/NAME="eth0"/' /etc/sysconfig/network-scripts/ifcfg-eth0
sed -i 's/NM_CONTROLLED=.*/NM_CONTROLLED="yes"/' /etc/sysconfig/network-scripts/ifcfg-eth1
sed -i 's/DEVICE=.*/DEVICE="eth1"/' /etc/sysconfig/network-scripts/ifcfg-eth1
sed -i 's/NAME=.*/NAME="eth1"/' /etc/sysconfig/network-scripts/ifcfg-eth1
nmcli connection reload

# Install the latest updates
yum update -y

# Install git
yum install -y git

# Install and configure docker-latest
yum install -y docker-latest
systemctl enable docker-latest
systemctl start docker-latest

# Install Python 3.5
yum install -y rh-python35
#scl enable rh-python35 bash

# Install PIP
curl -o- https://bootstrap.pypa.io/get-pip.py | python

# Install virtualenv
pip install virtualenv

# Install Ansible
yum install -y gcc python-devel openssl-devel libffi-devel
pip install ansible

# Install ansible-container
pip install ansible-container

# Generate an ssh key go be trusted locally
if [ ! -f ~vagrant/.ssh/id_rsa ]
then
  su -c "ssh-keygen -f ~vagrant/.ssh/id_rsa -b4096 -qP ''" vagrant
  cat ~vagrant/.ssh/id_rsa.pub >> ~vagrant/.ssh/authorized_keys
fi
