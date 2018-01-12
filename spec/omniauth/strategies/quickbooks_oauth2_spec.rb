require 'spec_helper'

RSpec.describe OmniAuth::Strategies::QuickbooksOauth2 do
  context 'sandbox' do
    it 'should default to sandbox' do
      strat = OmniAuth::Strategies::QuickbooksOauth2.new('foo', 'bar')
      expect(strat.send(:accounts_domain)).to eq('sandbox-accounts.platform.intuit.com')
    end

    it 'should respect the sandbox option' do
      strat = OmniAuth::Strategies::QuickbooksOauth2.new('foo', 'bar', sandbox: true)
      expect(strat.send(:accounts_domain)).to eq('sandbox-accounts.platform.intuit.com')

      strat = OmniAuth::Strategies::QuickbooksOauth2.new('foo', 'bar', sandbox: false)
      expect(strat.send(:accounts_domain)).to eq('accounts.platform.intuit.com')
    end
  end
end
