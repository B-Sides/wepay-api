module Wepay
  module Api
    class Base
      def initialize
      end

      private
      def get(path, params = {})
        make_request(:get, path, params)
      end

      def post(path, params = {})
        make_request(:post, path, params)
      end

      def make_request(http_method, path, params = {})
        client.send(http_method, path, params)
      end

      def client
        @client ||= ::Wepay::Client::Data.new
      end
    end
  end
end