module Wepay
  module Api
    class Account < Base
      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/account](https://www.wepay.com/developer/reference/account#lookup)
      #
      def show(params)
        get 'account', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/account/find](https://www.wepay.com/developer/reference/account#find)
      #
      def find(params)
        get 'account/find', params
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
      # @docs [/account/balance](https://www.wepay.com/developer/reference/account#balance)
      #
      def balance(params)
        get 'account/balance', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/account/add_bank](https://www.wepay.com/developer/reference/account#add_bank)
      #
      def add_bank(params)
        post 'account/add_bank', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/account/set_tax](https://www.wepay.com/developer/reference/account#set_tax)
      #
      def set_tax(params)
        post 'account/set_tax', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/account/get_tax](https://www.wepay.com/developer/reference/account#get_tax)
      #
      def get_tax(params)
        get 'account/get_tax', params
      end
    end
  end
end