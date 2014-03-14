require 'spec_helper'
describe 'physical' do

  describe 'when manufacturer is hp' do
    [true,'true'].each do |value|
      context "and enable_hp parameter is set to #{value}" do
        let(:facts) { { :manufacturer => 'hp' } }
        let(:params) { { :enable_hp => value } }

        it { should contain_class('hp') }
      end
    end

    [false,'false'].each do |value|
      context "and enable_hp parameter is set to #{value}" do
        let(:facts) { { :manufacturer => 'hp' } }
        let(:params) { { :enable_hp => value } }

        it { should_not contain_class('hp') }
      end
    end
  end

  describe 'should fail on unsupported' do
    let :facts do
      { :manufacturer => 'invalid' }
    end

    it {
      expect {
        should contain_class('hp')
      }.to raise_error(Puppet::Error, /Manufacturer <invalid> is not supported./)
    }
  end
end
