require "faraday"
require "faraday_middleware"

module Wepay
  class Client
    DEFAULTS = {
      open_timeout: 5,
      timeout:      10
    }

    def initialize
      @connection = Faraday.new(url, connection_options) do |builder|
        # Request
        builder.use Wepay::Middleware::CatchTimeout

        yield builder if block_given?

        # Response
        builder.use FaradayMiddleware::Mashify
        builder.use Wepay::Middleware::CheckStatus
        builder.use FaradayMiddleware::ParseJson

        builder.adapter :net_http
      end
    end

    def get(*args, &block)
      make_request(:get, *args, &block)
    end

    def post(*args, &block)
      make_request(:post, *args, &block)
    end

    private

    def connection_options
      {
        request: {
          open_timeout:   open_timeout,
          timeout:        timeout,
        }
      }
    end

    def url
      raise NotImplementedError
    end

    def make_request(http_method, *args, &block)
      response = @connection.send(http_method, *args, &block)
      response.body
    end

    def open_timeout
      Wepay.open_timeout || DEFAULTS[:open_timeout]
    end

    def timeout
      Wepay.timeout || DEFAULTS[:timeout]
    end
  end
end