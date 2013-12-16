module Wepay
  module Api
    class Subscription < Base
      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/subscription](https://www.wepay.com/developer/reference/subscription#lookup)
      #
      def show(params)
        post 'subscription', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/subscription/find](https://www.wepay.com/developer/reference/subscription#find)
      #
      def find(params)
        post 'subscription/find', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/subscription/create](https://www.wepay.com/developer/reference/subscription#create)
      #
      def create(params)
        post 'subscription/create', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/subscription/cancel](https://www.wepay.com/developer/reference/subscription#cancel)
      #
      def cancel(params)
        post 'subscription/cancel', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/subscription/modify](https://www.wepay.com/developer/reference/subscription#modify)
      #
      def modify(params)
        post 'subscription/modify', params
      end
    end
  end
end