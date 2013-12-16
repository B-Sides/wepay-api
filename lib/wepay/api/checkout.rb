module Wepay
  module Api
    class Checkout < Base
      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/checkout](https://www.wepay.com/developer/reference/checkout#lookup)
      #
      def show(params)
        post 'checkout', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/checkout/find](https://www.wepay.com/developer/reference/checkout#find)
      #
      def find(params)
        post 'checkout/find', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/checkout/create](https://www.wepay.com/developer/reference/checkout#create)
      #
      def create(params)
        post 'checkout/create', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/checkout/cancel](https://www.wepay.com/developer/reference/checkout#cancel)
      #
      def cancel(params)
        post 'checkout/cancel', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/checkout/refund](https://www.wepay.com/developer/reference/checkout#refund)
      #
      def refund(params)
        post 'checkout/refund', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/checkout/capture](https://www.wepay.com/developer/reference/checkout#capture)
      #
      def capture(params)
        post 'checkout/capture', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/checkout/modify](https://www.wepay.com/developer/reference/checkout#modify)
      #
      def modify(params)
        post 'checkout/modify', params
      end
    end
  end
end