# == Class: atomic
#
# Actions:
#   Configure the proper repositories and import GPG keys
#
# Reqiures:
#   You should probably be on an Enterprise Linux variant. (Centos, RHEL,
#   Scientific, Oracle, Ascendos, et al)
#
# Sample Usage:
#  include atomic
#
class atomic (
  $baseurl            = 'absent',
  $mirrorlist         = $atomic::params::mirrorlist,
  $testing_baseurl    = 'absent',
  $testing_mirrorlist = $atomic::params::testing_mirrorlist,
  $proxy              = $atomic::params::proxy,
  $includepkgs        = $atomic::params::includepkgs,
  $exclude            = $atomic::params::exclude,
  $gpgkey             = $atomic::params::gpgkey,
) inherits atomic::params {

  if $::osfamily == 'RedHat' and $::operatingsystem != 'Fedora' {
    yumrepo { 'atomic':
      baseurl        => $baseurl,
      mirrorlist     => $mirrorlist,
      failovermethod => 'priority',
      priority       => '1',
      protect        => '0',
      proxy          => $proxy,
      includepkgs    => $includepkgs,
      exclude        => $exclude,
      enabled        => '1',
      gpgcheck       => '1',
      gpgkey         => $gpgkey,
      descr          => "CentOS / Red Hat Enterprise Linux ${::operatingsystemmajrelease} - atomicrocketturtle.com"
    }

    yumrepo { 'atomic-testing':
      baseurl        => $testing_baseurl,
      mirrorlist     => $testing_mirrorlist,
      failovermethod => 'priority',
      priority       => '1',
      protect        => '0',
      proxy          => $proxy,
      includepkgs    => $includepkgs,
      exclude        => $exclude,
      enabled        => '0',
      gpgcheck       => '1',
      gpgkey         => $gpgkey,
      descr          => "CentOS / Red Hat Enterprise Linux ${::operatingsystemmajrelease} - atomicrocketturtle.com (Testing)"
    }
  } else {
    notice ("Your operating system ${::operatingsystem} will not have the atomic repository applied")
  }

}
