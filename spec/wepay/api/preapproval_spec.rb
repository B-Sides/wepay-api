require "spec_helper"

describe Wepay::Api::Preapproval do
  let(:it) { described_class.new }
  record_api_methods

  describe "#show" do
    it "shows the info of a preapproval" do
      data = it.show(
        preapproval_id:     123456789,
        access_token:       "access_token"
      )
      expect(data).to have_keys :preapproval_id, :preapproval_uri, :manage_uri, :account_id, :short_description, :currency, :amount, :fee_payer, :state,
                                :redirect_uri, :app_fee, :period, :frequency, :start_time, :end_time
    end
  end

  describe "#find" do
    it "finds all the preapprovals of an account" do
      data = it.find(
        account_id:         123456,
        access_token:       "access_token"
      )

      expect(data).to be_a Array
      expect(data.first).to have_keys :preapproval_id, :preapproval_uri, :manage_uri, :account_id, :short_description, :currency, :amount, :fee_payer, :state,
        :redirect_uri, :app_fee, :period, :frequency, :start_time, :end_time
    end
  end

  describe "#create" do
    it "creates a preapproval" do
      data = it.create(
        short_description:	"Payment",
        period:	            "yearly",
        amount:             10,
        account_id:         123456,
        access_token:       "access_token"
      )

      expect(data).to have_keys :preapproval_id, :preapproval_uri
    end
  end

  describe "#cancel" do
    it "cancels a preapproval with a reason" do
      data = it.cancel(
        preapproval_id:     123456789,
        access_token:       "access_token"
      )

      expect(data).to have_keys :preapproval_id, :state
      expect(data.state).to eq 'cancelled'
    end
  end

  describe "#modify" do
    it "modifies a preapproval" do
      data = it.modify(
        preapproval_id:     123456789,
        callback_uri:       "https://www.example.com/ipn/12345",
        access_token:       "access_token"
      )

      expect(data).to have_keys       :preapproval_id, :callback_uri
      expect(data.callback_uri).to eq "https://www.example.com/ipn/12345"
    end
  end
end