require 'spec_helper'
describe 'atom::install' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      context 'configure the atom ppa' do
        it { should contain_apt__ppa('ppa:webupd8team/atom') }
      end

      context 'install atom with defaults' do
        it { should contain_package('atom').with_ensure('latest') }
      end

      it { should contain_apt__ppa('ppa:webupd8team/atom').that_notifies('Class[apt::update]') }
      it { should contain_package('atom').that_requires('Class[apt::update]') }
    end
  end
end
