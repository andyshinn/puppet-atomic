# Configure Atomicorp Free RPMS Repository
A Puppet module to configure the Atomicorp Free RPMS Repository.

## About
This module is a fork of https://github.com/stahnma/puppet-module-epel rewritten for the Atomicorp Free RPMS Repository (http://www.atomicorp.com/installers/atomic)

The following Repos will be setup and enabled by default:

  * atomic

Other repositories that will setup but disabled by default:

  * atomic-testing
  * atomic-bleeding

## Proxy
If you have an HTTP proxy required to access the internet, you can use the
`$proxy` variable in the params.pp file. If it is set to a value other than
'absent' a proxy will be setup with each repository.  Note that otherwise each
of the repos will fall back to settings in the /etc/yum.conf file.

## Futher Information

* [Atomic Repository Installer](http://www.atomicorp.com/installers/atomic)
* [Atomic Repository List](https://www2.atomicorp.com/channels/atomic/centos/6/x86_64/)

## Testing

* Tested using Puppet 3.1.x on CentOS 6
