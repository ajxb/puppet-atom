require 'spec_helper'
describe 'atom' do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      it { is_expected.to compile.with_all_deps }
      it { should contain_class('atom') }
      it { should contain_class('atom::config') }
      it { should contain_class('atom::install') }
      it { should contain_class('atom::params') }
      it { is_expected.to contain_class('atom::install').that_comes_before('Class[atom::config]') }
    end
  end

  context 'with unsupported operatingsystem' do
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
