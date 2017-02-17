require 'spec_helper'
describe 'atom' do
  context 'with default values for all parameters' do
    it { should contain_class('atom') }
  end
end
