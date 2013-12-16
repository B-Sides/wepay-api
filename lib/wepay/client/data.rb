module Wepay
  ##
  # Client for query and manipulation of Wepay's data.
  #
  class Client::Data < Client
    def initialize
      super() do |builder|
        # Request
        builder.use FaradayMiddleware::EncodeJson
      end
    end

    private
    def url
      Wepay.api_endpoint
    end

    def make_request(http_method, *args, &block)
      params          = args[1]
      access_token    = params.delete(:access_token) if params.is_a?(Hash)
      access_token  ||= Wepay.access_token

      response = @connection.send http_method, *args do |builder|
        builder.headers['Authorization'] = "Bearer #{access_token}"
        block.call(builder) if block_given?
      end

      response.body
    end
  end
end