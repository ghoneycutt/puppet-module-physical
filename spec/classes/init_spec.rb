require 'spec_helper'
describe 'physical' do

  describe 'should include hp class if enabled' do

    let :facts do
      { :manufacturer => 'hp' }
    end
    let :params do
      { :enable_hp => true }
    end

    it { should contain_class('hp') }

  end
  describe 'should not include hp class if disabled' do

    let :facts do
      { :manufacturer => 'hp' }
    end
    let :params do
      { :enable_hp => false }
    end

    it { should_not contain_class('hp') }

  end

  describe 'should accept string input for hp' do

    let :facts do
      { :manufacturer => 'hp' }
    end
    let :params do
      { :enable_hp => "true" }
    end

    it { should contain_class('hp') }

  end

  describe 'should not include hp class if supermicro' do

    let :facts do
      { :manufacturer => 'Supermicro' }
    end

    it { should_not contain_class('hp') }

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
