require 'spec_helper'
describe 'atom' do

  context 'On Ubuntu OS with default parameters' do
    let :facts do
      {
        :lsbdistcodename => 'xenial',
        :lsbdistid       => 'Ubuntu',
        :lsbdistrelease  => '16.04',
        :operatingsystem => 'Ubuntu',
        :osfamily        => 'Debian',
        :puppetversion   => Puppet.version,
      }
    end

    it { is_expected.to compile.with_all_deps }
    it { should contain_class('atom') }
    it { should contain_class('atom::config') }
    it { should contain_class('atom::install') }
    it { should contain_class('atom::params') }
    it { is_expected.to contain_class('atom::install').that_comes_before('Class[atom::config]') }
  end

  context 'With unsupported operatingsystem' do
    let :facts do
      {
        :operatingsystem => 'Unsupported OS',
      }
    end

    it {
      expect {
        subject.call
      }.to raise_error(Puppet::Error, /Unsupported OS not supported/)
    }
  end
end
