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

      expect(data).to have_keys :account_id, :name, :state, :description, :account_uri, :payment_limit, :verification_state, :type, :create_time
    end
  end

  describe "#find" do
    it 'finds the accounts of the user associated with the access token' do
      data = it.find(
        access_token:   'access_token'
      )

      expect(data).to       be_a Array
      expect(data.first).to have_keys :account_id, :name, :state, :description, :account_uri, :payment_limit, :verification_state, :type, :create_time
    end
  end

  describe "#create" do
    it "creates an account" do
      data = it.create(
        name:         "New Account",
        description:  "Created by API",
        access_token: 'access_token'
      )

      expect(data).to have_keys :account_id, :account_uri
    end
  end

  describe "#modify" do
    it "modifies an account" do
      data = it.modify(
        account_id:   "123456",
        name:         "New Account Name",
        access_token: 'access_token'
      )

      expect(data).to       have_keys :account_id, :name, :state, :description, :account_uri, :payment_limit, :verification_state, :type, :create_time
      expect(data.name).to  eq "New Account Name"
    end
  end

  describe "#delete" do
    it "deletes an account" do
      data = it.delete(
        account_id:   "123456",
        access_token: 'access_token'
      )

      expect(data).to       have_keys :account_id, :state
      expect(data.state).to eq "deleted"
    end
  end

  describe "#balance" do
    it "gets balance of an account" do
      data = it.balance(
        account_id:   "123456",
        access_token: 'access_token'
      )

      expect(data).to have_keys :pending_balance, :available_balance, :currency
    end
  end

  describe "#add_bank" do
    it "adds bank to an account" do
      data = it.add_bank(
        account_id:   "123456",
        access_token: 'access_token'
      )

      expect(data).to have_keys :account_id, :add_bank_uri
    end
  end

  describe "#set_tax" do
    it "sets tax of an account" do
      # to be added
    end
  end

  describe "#get_tax" do
    it "gets tax of an account" do
      # to be added
    end
  end
end