require "spec_helper"

describe Wepay::Api::Subscription do
  let(:it) { described_class.new }
  record_api_methods

  describe "#show" do
    it "shows the info of a subscription" do
      data = it.show(
        subscription_id:        123456789,
        access_token:           "access_token"
      )

      expect(data).to have_keys :subscription_plan_id, :subscription_id, :subscription_uri, :payer_name, :payer_email, :currency, :amount, :period, :app_fee, :fee_payer, :redirect_uri, :callback_uri, :state, :quantity, :reference_id
    end
  end

  describe "#find" do
    it "finds all the subscriptions of an account" do
      data = it.find(
        subscription_plan_id:   1234567890,
        access_token:           "access_token"
      )

      expect(data).to       be_a Array
      expect(data.first).to have_keys :subscription_plan_id, :subscription_id, :subscription_uri, :payer_name, :payer_email, :currency, :amount, :period, :app_fee, :fee_payer, :redirect_uri, :callback_uri, :state, :quantity, :reference_id
    end
  end

  describe "#create" do
    it "creates a subscription" do
      data = it.create(
        subscription_plan_id:   1234567890,
        access_token:           "access_token"
      )

      expect(data).to have_keys :subscription_id, :subscription_uri
    end
  end

  describe "#cancel" do
    it "cancels a subscription" do
      data = it.cancel(
        subscription_id:    123456789,
        reason:             'no reason',
        access_token:       "access_token"
      )

      expect(data).to have_keys :subscription_id, :reason
    end
  end

  describe "#modify" do
    it "modifies a subscription" do
      data = it.modify(
        subscription_id:    123456789,
        callback_uri:       "https://www.example.com/ipn/12345",
        access_token:       "access_token"
      )

      expect(data).to have_keys       :subscription_id, :callback_uri
      expect(data.callback_uri).to eq "https://www.example.com/ipn/12345"
    end
  end
end