require "spec_helper"

describe Wepay::Api do
  let(:it) { Wepay }

  it "provides interface for API calls" do
    expect(it.checkout).to be_a Wepay::Api::Checkout
  end
end