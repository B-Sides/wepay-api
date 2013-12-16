module Wepay
  module Api
    class Withdrawal < Base
      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/withdrawal](https://www.wepay.com/developer/reference/withdrawal#lookup)
      #
      def show(params)
        post 'withdrawal', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/withdrawal/find](https://www.wepay.com/developer/reference/withdrawal#find)
      #
      def find(params)
        post 'withdrawal/find', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/withdrawal/create](https://www.wepay.com/developer/reference/withdrawal#create)
      #
      def create(params)
        post 'withdrawal/create', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/withdrawal/modify](https://www.wepay.com/developer/reference/withdrawal#modify)
      #
      def modify(params)
        post 'withdrawal/modify', params
      end
    end
  end
end