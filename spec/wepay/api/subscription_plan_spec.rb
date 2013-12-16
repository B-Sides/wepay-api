require "spec_helper"

describe Wepay::Api::SubscriptionPlan do
  let(:it) { described_class.new }
  record_api_methods

  describe "#show" do
    it "shows the info of a subscription plan" do
      data = it.show(
        subscription_plan_id:   397668101,
        access_token:           "access_token"
      )

      expect(data).to have_keys :subscription_plan_id, :account_id, :name, :short_description, :currency, :amount, :period, :app_fee, :fee_payer, :number_of_subscriptions, :callback_uri, :state, :trial_length, :setup_fee
    end
  end

  describe "#find" do
    it "finds all the subscription plans of an account" do
      data = it.find(
        account_id:         123456,
        access_token:       "access_token"
      )

      expect(data).to       be_a Array
      expect(data.first).to have_keys :subscription_plan_id, :account_id, :name, :short_description, :currency, :amount, :period, :app_fee, :fee_payer, :number_of_subscriptions, :callback_uri, :state, :trial_length, :setup_fee
    end
  end

  describe "#create" do
    it "creates a subscription plan" do
      data = it.create(
        name:	              "Subscription plan 1",
        short_description:	"Short description",
        amount:             10,
        period:             "yearly",
        account_id:         123456,
        access_token:       "access_token"
      )

      expect(data).to have_keys :subscription_plan_id
    end
  end

  describe "#delete" do
    it "deletes a subscription plan" do
      data = it.delete(
        subscription_plan_id:       397668101,
        reason:                     "no resson",
        access_token:               "access_token"
      )

      expect(data).to       have_keys :subscription_plan_id, :state
      expect(data.state).to eq "Deleted"
    end
  end

  describe "#get_button" do
    it "gets button of a subscription plan" do
      data = it.get_button(
        subscription_plan_id:       397668101,
        button_type:                "subscription_plan",
        account_id:                 123456,
        access_token:               "access_token"
      )

      expect(data).to have_keys :subscription_plan_id, :subscription_button_code
    end
  end

  describe "#modify" do
    it "modifies a subscription plan" do
      data = it.modify(
        subscription_plan_id:       397668101,
        callback_uri:               "https://www.example.com/ipn/12345",
        access_token:               "access_token"
      )

      expect(data).to have_keys       :subscription_plan_id, :callback_uri
      expect(data.callback_uri).to eq "https://www.example.com/ipn/12345"
    end
  end
end