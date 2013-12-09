require "spec_helper"

describe Wepay::Api::Checkout do
  let(:it) { described_class.new }
  record_api_methods

  describe "#show" do
    it "shows the info of a checkout" do
      data = it.show(
        checkout_id:        1234567890
      )
      expect(data).to have_keys :checkout_id, :checkout_uri, :amount, :state, :type, :short_description, :fee_payer
    end
  end

  describe "#find" do
    it "finds all the checkouts of an account" do
      data = it.find(
        account_id:         123456
      )

      expect(data).to be_a Array
      expect(data.first).to have_keys :checkout_id, :checkout_uri, :amount, :state, :type, :short_description, :fee_payer
    end
  end

  describe "#create" do
    it "creates a checkout" do
      data = it.create(
        account_id:         123456,
        short_description:	"Film payment",
        type:               "GOODS",
        amount:	            10
      )

      expect(data).to have_keys :checkout_id, :checkout_uri
    end
  end

  describe "#cancel" do
    it "cancels a checkout with a reason" do
      data = it.cancel(
        checkout_id:        1234567890,
        cancel_reason:      "no reason"
      )

      expect(data).to have_keys :checkout_id, :state
      expect(data.state).to eq 'cancelled'
    end
  end

  describe "#refund" do
    it "refunds a checkout with a reason" do
      data = it.refund(
        checkout_id:        1234567890,
        refund_reason:      "no reason"
      )

      expect(data).to have_keys :checkout_id, :state
      expect(data.state).to eq 'refunded'
    end
  end

  describe "#capture" do
    it "captures a reserved checkout" do
      data = it.capture(
        checkout_id:        1234567890
      )

      expect(data).to have_keys :checkout_id, :state
      expect(data.state).to eq 'captured'
    end
  end

  describe "#modify" do
    it "modifies a checkout" do
      data = it.modify(
        checkout_id:        1234567890,
        callback_uri:       "https://www.example.com/ipn/12345"
      )

      expect(data).to have_keys :checkout_id, :callback_uri
      expect(data.callback_uri).to eq "https://www.example.com/ipn/12345"
    end
  end
end