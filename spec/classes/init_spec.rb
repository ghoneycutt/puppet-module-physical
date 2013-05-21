require 'spec_helper'

describe 'physical' do

  describe 'should include hp class if enabled' do

    let :facts do
      { :manufacturer => 'hp' }
    end
    let :params do
      { :enable_hp => true }
    end

    it { should include_class('hp') }

  end
  describe 'should not include hp class if disabled' do

    let :facts do
      { :manufacturer => 'hp' }
    end
    let :params do
      { :enable_hp => false }
    end

    it { should_not include_class('hp') }

  end

  describe 'should accept string input for hp' do

    let :facts do
      { :manufacturer => 'hp' }
    end
    let :params do
      { :enable_hp => "true" }
    end

    it { should include_class('hp') }

  end

  describe 'should fail on unsupported' do
    let :facts do
      { :manufacturer => 'invalid' }
    end

    it {
      expect {
        should have_class_count(0)
      }.to raise_error(Puppet::Error, /Manufacturer <invalid> is not supported./)
    }
  end
end
