module Wepay
  module Api
    class SubscriptionPlan < Base
      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/subscription_plan](https://www.wepay.com/developer/reference/subscription_plan#lookup)
      #
      def show(params)
        post 'subscription_plan', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/subscription_plan/find](https://www.wepay.com/developer/reference/subscription_plan#find)
      #
      def find(params)
        post 'subscription_plan/find', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/subscription_plan/create](https://www.wepay.com/developer/reference/subscription_plan#create)
      #
      def create(params)
        post 'subscription_plan/create', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/subscription_plan/delete](https://www.wepay.com/developer/reference/subscription_plan#delete)
      #
      def delete(params)
        post 'subscription_plan/delete', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/subscription_plan/get_button](https://www.wepay.com/developer/reference/subscription_plan#get_button)
      #
      def get_button(params)
        post 'subscription_plan/get_button', params
      end

      ##
      # @param params [Hash] See documentation below
      # @return [Hashie::Mash]
      # @docs [/subscription_plan/modify](https://www.wepay.com/developer/reference/subscription_plan#modify)
      #
      def modify(params)
        post 'subscription_plan/modify', params
      end
    end
  end
end