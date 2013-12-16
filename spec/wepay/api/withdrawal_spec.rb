require "spec_helper"

describe Wepay::Api::Withdrawal do
  let(:it) { described_class.new }
  record_api_methods

  describe "#show" do
    it "shows the info of a withdrawal" do
      data = it.show(
        withdrawal_id:      123456789,
        access_token:       "access_token"
      )

      expect(data).to have_keys :withdrawal_id, :withdrawal_uri, :account_id, :state, :redirect_uri, :callback_uri, :amount, :note, :create_time, :capture_time, :recipient_confirmed
    end
  end

  describe "#find" do
    it "finds all the withdrawals of an account" do
      data = it.find(
        account_id:         123456,
        access_token:       "access_token"
      )

      expect(data).to       be_a Array
      expect(data.first).to have_keys :withdrawal_id, :withdrawal_uri, :account_id, :state, :redirect_uri, :callback_uri, :amount, :note, :create_time, :capture_time, :recipient_confirmed
    end
  end

  describe "#create" do
    it "creates a withdrawal" do
      data = it.create(
        account_id:         123456,
        access_token:       "access_token"
      )

      expect(data).to have_keys :withdrawal_id, :withdrawal_uri
    end
  end

  describe "#modify" do
    it "modifies a withdrawal" do
      data = it.modify(
        withdrawal_id:      123456789,
        callback_uri:       "https://www.example.com/ipn/12345",
        access_token:       "access_token"
      )

      expect(data).to have_keys       :withdrawal_id, :callback_uri
      expect(data.callback_uri).to eq "https://www.example.com/ipn/12345"
    end
  end
end