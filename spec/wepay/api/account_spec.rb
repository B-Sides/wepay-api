require "spec_helper"

describe Wepay::Api::Account do
  let(:it) { described_class.new }
  record_api_methods

  describe "#show" do
    it "shows the info of an account" do
      data = it.show(
        account_id:     123456,
        access_token:   'access_token'
      )

      expect(data).to have_keys :account_id, :name, :state, :description, :account_uri, :payment_limit, :verification_state, :type
    end
  end

  describe "#find" do
    # to be added
  end

  describe "#create" do
    it "creates an account for a user" do
      data = it.create(
        name:         "New Account",
        description:  "Created by API",
        access_token: 'access_token'
      )

      expect(data).to have_keys :account_id, :account_uri
    end
  end

  describe "#modify" do
    # to be added
  end

  describe "#delete" do
    # to be added
  end

  describe "#balance" do
    # to be added
  end

  describe "#add_bank" do
    # to be added
  end

  describe "#set_tax" do
    # to be added
  end

  describe "#get_tax" do
    # to be added
  end
end