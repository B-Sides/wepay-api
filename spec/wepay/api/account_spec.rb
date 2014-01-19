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

      expect(data).to have_keys :account_id, :name, :state, :description, :type, :create_time, :country, :currencies, :balances, :statuses, :action_reasons
    end
  end

  describe "#find" do
    it 'finds the accounts of the user associated with the access token' do
      data = it.find(
        access_token:   'access_token'
      )

      expect(data).to       be_a Array
      expect(data.first).to have_keys :account_id, :name, :state, :description, :type, :create_time, :country, :currencies, :balances, :statuses, :action_reasons
    end
  end

  describe "#create" do
    it "creates an account" do
      data = it.create(
        name:         "New Account",
        description:  "Created by API",
        access_token: 'access_token'
      )

      expect(data).to have_keys :account_id, :name, :state, :description, :type, :create_time, :country, :currencies, :balances, :statuses, :action_reasons
    end
  end

  describe "#modify" do
    it "modifies an account" do
      data = it.modify(
        account_id:   "123456",
        name:         "New Account Name",
        access_token: 'access_token'
      )

      expect(data).to have_keys :account_id, :name, :state, :description, :type, :create_time, :country, :currencies, :balances, :statuses, :action_reasons
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

  describe "#get_update_uri" do
    it "gets update uri of an account" do
      data = it.get_update_uri(
        account_id:   "123456",
        access_token: 'access_token'
      )

      expect(data).to have_keys :account_id, :uri
    end
  end

  describe "#get_reserve_details" do
    it "gets reserve details of an account" do
      data = it.get_reserve_details(
        account_id:   "123456",
        access_token: 'access_token'
      )

      expect(data).to have_keys :account_id, :currency, :reserved_amount, :withdrawals_schedule
    end
  end
end