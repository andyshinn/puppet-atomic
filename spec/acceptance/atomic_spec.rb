require 'spec_helper_acceptance'

describe 'atomic class' do
  context 'default parameters' do
    it 'should run successfully' do
      pp =<<-EOS
        class { 'atomic': }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    # Enabled by default
    describe yumrepo('atomic') do
      it { should exist }
      it { should be_enabled }
    end

    # Disabled by default
    describe yumrepo('atomic-testing') do
      it { should exist }
      it { should_not be_enabled }
    end
  end

  context 'install package' do
    it 'should run successfully' do
      pp =<<-EOS
        class { 'atomic': }
        package { 'ossec-hids-client':
          ensure  => 'latest',
          require => Yumrepo['atomic'],
        }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe package('ossec-hids-client') do
      it { should be_installed }
    end
  end
end
