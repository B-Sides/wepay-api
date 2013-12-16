module Wepay
  module Api
    class Preapproval < Base
      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/preapproval](https://www.wepay.com/developer/reference/preapproval#lookup)
      #
      def show(params)
        post 'preapproval', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/preapproval/find](https://www.wepay.com/developer/reference/preapproval#find)
      #
      def find(params)
        post 'preapproval/find', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/preapproval/create](https://www.wepay.com/developer/reference/preapproval#create)
      #
      def create(params)
        post 'preapproval/create', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/preapproval/cancel](https://www.wepay.com/developer/reference/preapproval#cancel)
      #
      def cancel(params)
        post 'preapproval/cancel', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/preapproval/modify](https://www.wepay.com/developer/reference/preapproval#modify)
      #
      def modify(params)
        post 'preapproval/modify', params
      end
    end
  end
end