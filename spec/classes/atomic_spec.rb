require 'spec_helper'

describe 'atomic' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      it { should create_class('atomic') }
      it { should contain_class('atomic::params') }

      it { should have_yumrepo_resource_count(2) }

      it do
        should contain_yumrepo('atomic').only_with({
          :name           => 'atomic',
          :baseurl        => 'absent',
          :mirrorlist     => "http://updates.atomicorp.com/channels/mirrorlist/atomic/centos-#{facts[:operatingsystemmajrelease]}-x86_64",
          :failovermethod => 'priority',
          :priority       => '1',
          :protect        => '0',
          :proxy          => 'absent',
          :includepkgs    => 'absent',
          :exclude        => 'absent',
          :enabled        => '1',
          :gpgcheck       => '1',
          :gpgkey         => 'https://www.atomicorp.com/RPM-GPG-KEY.art.txt https://www.atomicorp.com/RPM-GPG-KEY.atomicorp.txt',
          :descr          => "CentOS / Red Hat Enterprise Linux #{facts[:operatingsystemmajrelease]} - atomicrocketturtle.com"
        })
      end

      it do
        should contain_yumrepo('atomic-testing').only_with({
          :name           => 'atomic-testing',
          :baseurl        => 'absent',
          :mirrorlist     => "http://updates.atomicorp.com/channels/mirrorlist/atomic-testing/centos-#{facts[:operatingsystemmajrelease]}-x86_64",
          :failovermethod => 'priority',
          :priority       => '1',
          :protect        => '0',
          :proxy          => 'absent',
          :includepkgs    => 'absent',
          :exclude        => 'absent',
          :enabled        => '0',
          :gpgcheck       => '1',
          :gpgkey         => 'https://www.atomicorp.com/RPM-GPG-KEY.art.txt https://www.atomicorp.com/RPM-GPG-KEY.atomicorp.txt',
          :descr          => "CentOS / Red Hat Enterprise Linux #{facts[:operatingsystemmajrelease]} - atomicrocketturtle.com (Testing)"
        })
      end
    end
  end
end
