require 'spec_helper'
describe 'atom::config' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      context 'The machine is virtual' do
        let :facts do
          facts.merge(
            is_virtual: true
          )
        end
        it { should contain_file('/etc/profile.d/atom.sh').with_ensure('file') }
        it { should contain_file('/usr/share/applications/atom.desktop').with_content(%r{^Exec=/opt/atom/atom %F --disable-gpu$}) }
      end

      context 'The machine is physical' do
        let :facts do
          facts.merge(
            is_virtual: false
          )
        end
        it { should contain_file('/etc/profile.d/atom.sh').with_ensure('absent') }
        it { should contain_file('/usr/share/applications/atom.desktop').with_content(%r{^Exec=/opt/atom/atom %F$}) }
      end

      context 'disable_gpu has been explicitly set to true' do
        let :params do
          {
            disable_gpu: true
          }
        end
        it { should contain_file('/etc/profile.d/atom.sh').with_ensure('file') }
        it { should contain_file('/usr/share/applications/atom.desktop').with_content(%r{^Exec=/opt/atom/atom %F --disable-gpu$}) }
      end

      context 'disable_gpu has been explicitly set to false' do
        let :params do
          {
            disable_gpu: false
          }
        end
        it { should contain_file('/etc/profile.d/atom.sh').with_ensure('absent') }
        it { should contain_file('/usr/share/applications/atom.desktop').with_content(%r{^Exec=/opt/atom/atom %F$}) }
      end
    end
  end
end
