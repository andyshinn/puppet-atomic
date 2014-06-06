# == Class: atomic::params
#
# Optional parameters in setting up Atomic Repo
#
class atomic::params {

  if $::osfamily == 'RedHat' and $::operatingsystem != 'Fedora' {
    $mirrorlist         = "http://updates.atomicorp.com/channels/mirrorlist/atomic/centos-${::operatingsystemmajrelease}-${::architecture}"
    $testing_mirrorlist = "http://updates.atomicorp.com/channels/mirrorlist/atomic-testing/centos-${::operatingsystemmajrelease}-${::architecture}"
    $gpgkey             = 'https://www.atomicorp.com/RPM-GPG-KEY.art.txt https://www.atomicorp.com/RPM-GPG-KEY.atomicorp.txt'

    $proxy              = 'absent'
    $includepkgs        = 'absent'
    $exclude            = 'absent'
  }

}
