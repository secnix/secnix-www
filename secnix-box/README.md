## What is this?

This box contains all the contents of a fully-provisioned secnix-www/secnix-boxboot
which runs NGINX, WordPress and MariaDB Docker containers. 

It shares the directory in secnix-www/. mounted as /vagrant in the instance. 
Therefore, the contents of secnix-www/site is /vagrant/site in a running box.

## What else is installed?

`ansible` and `ansible-container` is installed to build, manage and deploy the 
entire stack to CI/CD, Docker registries and other platforms on demand.

## How does a developer use it?

After you change to this directory, or `secnix-www/secnix-box`, one can issue
the `vagrant up` command. It will fetch the latest build of this box from the
Vagrant Cloud catalog and instantiate it. The developer will access the box 
from their workstation by either http://192.168.33.10 or create an `/etc/hosts`
entry and access it via http://example.com.

```
$ cat /etc/hosts
...
192.168.33.10 www.example.com example.com
```

