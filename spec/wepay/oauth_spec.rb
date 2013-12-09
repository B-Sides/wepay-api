require "spec_helper"

describe Wepay::OAuth do
  let(:it) { Class.new.send :extend, described_class }

  describe ".authorization_url" do
    it "returns oauth authorization url" do
      url = it.authorization_url("http://example.com/return_url")
      expect(url).to include "http://example.com/return_url"
    end
  end

  describe ".get_access_token" do
    it "gets the access token from Wepay OAuth" do
      client_mock = double :token_client
      Wepay::Client::Token.should_receive(:new).and_return(client_mock)

      client_mock.should_receive(:get_access_token).with('code', "http://example.com/return_url")

      it.get_access_token('code', "http://example.com/return_url")
    end
  end
end