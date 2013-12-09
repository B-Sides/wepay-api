require "spec_helper"

describe Wepay::Configuration do
  it "provides configuration" do
    Wepay.configure do |config|
      config.client_id     = 'client_id'
      config.client_secret = 'client_secret'
      config.access_token  = 'access_token'
      config.account_id    = 'account_id'
      config.scope         = 'scope'
      config.using_stage   = true
      config.open_timeout  = 1
      config.timeout       = 2
    end

    expect(Wepay.client_id).to      eq "client_id"
    expect(Wepay.client_secret).to  eq "client_secret"
    expect(Wepay.access_token).to   eq "access_token"
    expect(Wepay.account_id).to     eq "account_id"
    expect(Wepay.scope).to          eq "scope"
    expect(Wepay.using_stage).to    eq true
    expect(Wepay.open_timeout).to   eq 1
    expect(Wepay.timeout).to        eq 2
  end
end