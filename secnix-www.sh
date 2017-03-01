#!/usr/bin/env sh
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

# Install ansible-container
pip install ansible-container
