# -*- mode: ruby -*-
# vi: set ft=ruby :
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

Vagrant.configure(2) do |config|
  config.vm.box = "jhcook/centos7"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = "2"
  end
  config.vm.provision "shell", path: "secnix-www.sh"
  config.vm.provision "reload"
  config.vm.provision "shell", inline: "ifup eth1 || /bin/true", run: "always"
end
