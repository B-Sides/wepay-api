require "faraday"
require "faraday_middleware/response_middleware"

module Wepay
  module Middleware
    ##
    # Translates `Faraday::Error::TimeoutError` into `Wepay::TimeoutError`.
    #
    # @raise Wepay::TimeoutError
    #
    class CatchTimeout
      def initialize(app)
        @app = app
      end

      def call(env)
        begin
          @app.call(env)
        rescue Faraday::Error::TimeoutError
          raise Wepay::TimeoutError
        end
      end
    end

    ##
    # Checks for errors in responses from Wepay, in which case it raises a
    # `Wepay::ApiError` which contains the code and the message found in the response.
    #
    # @raise Wepay::ApiError
    #
    class CheckStatus < Faraday::Response::Middleware
      def on_complete(env)
        response = env[:body]
        if response.is_a?(Hash) && response["error"]
          type    = response["error"]
          message = response["error_description"]
          code    = response["error_code"]

          raise Wepay::ApiError.new(type, message, code)
        end
      end
    end
  end
end