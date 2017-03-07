# www.secnix.com

This is configuration used to model, develop and replicate errors for
www.secnix.com.

## Install

You need to install Virtualbox with the extension pack, vagrant and the
vagrant-reload plugin. 

`vagrant plugin install vagrant-reload`

## Use

In order to use this repo, please change directories to either the directory
`secnix-box` or `secnix-boxboot` and issue the `vagrant up` command. 

```
$ cd ~/repo/secnix-www/secnix-box
$ vagrant up
...
$ vagrant ssh
[vagrant@centos7-vbox ~]$
```

## Environment

At this point, you have a fully functioning system with all prerequisites
installed. The directory in the box `/vagrant` contains all the contents
in this repository. Therefore, anything changed in this repository in the box
will stay resident on the host computer. You can then use your host computer
to maintain this Git repository.

## Ansible

The `ansible` directory contains all the playbooks and automated definitions to
build and deploy the entire environment. 

## Site

The `site` directory contains all the static content and other custom code used
within the site. 
