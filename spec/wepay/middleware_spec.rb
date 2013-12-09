require "spec_helper"

describe Wepay::Middleware, :vcr do
  before :all do
    @client = Wepay::Client::Data.new
  end

  describe Wepay::Middleware::CheckStatus do
    it "raises a Wepay::ApiError with proper error type, message and code" do
      Wepay.configure { |config| config.access_token = nil }

      begin
        @client.get "null"
      rescue => error
        expect(error).to          be_a Wepay::ApiError
        expect(error.code).to     eq 1001
        expect(error.message).to  eq "invalid_request (1001): that is not a recognized WePay API call"
      end
    end
  end
end