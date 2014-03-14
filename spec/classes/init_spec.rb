require 'spec_helper'
describe 'physical' do

  it { should compile.with_all_deps }

  describe 'when manufacturer is hp' do
    [true,'true'].each do |value|
      context "and enable_hp parameter is set to #{value}" do
        let(:facts) { { :manufacturer => 'hp' } }
        let(:params) { { :enable_hp => value } }

        it { should contain_class('physical') }

        it { should contain_class('hp') }
      end
    end

    [false,'false'].each do |value|
      context "and enable_hp parameter is set to #{value}" do
        let(:facts) { { :manufacturer => 'hp' } }
        let(:params) { { :enable_hp => value } }

        it { should contain_class('physical') }

        it { should_not contain_class('hp') }
      end
    end
  end

  describe 'when manufacturer is' do
    context 'unset' do
      it { should contain_class('physical') }
      it { should_not contain_class('hp') }
    end

    context 'unknown' do
      it { should contain_class('physical') }
      it { should_not contain_class('hp') }
    end
  end
end
