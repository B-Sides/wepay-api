module Wepay
  module Api
    class Account < Base
      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/account](https://www.wepay.com/developer/reference/account#lookup)
      #
      def show(params)
        post 'account', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/account/find](https://www.wepay.com/developer/reference/account#find)
      #
      def find(params)
        post 'account/find', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/account/create](https://www.wepay.com/developer/reference/account#create)
      #
      def create(params)
        post 'account/create', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/account/modify](https://www.wepay.com/developer/reference/account#modify)
      #
      def modify(params)
        post 'account/modify', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/account/delete](https://www.wepay.com/developer/reference/account#delete)
      #
      def delete(params)
        post 'account/delete', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/account/get_update_uri](https://www.wepay.com/developer/reference/account#update_uri)
      #
      def get_update_uri(params)
        post 'account/get_update_uri', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/account/get_reserve_details](https://www.wepay.com/developer/reference/account#reserve)
      #
      def get_reserve_details(params)
        post 'account/get_reserve_details', params
      end
    end
  end
end