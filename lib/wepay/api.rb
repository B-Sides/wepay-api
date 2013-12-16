module Wepay
  module Api
    def account
      Wepay::Api::Account.new
    end

    def checkout
      Wepay::Api::Checkout.new
    end

    def preapproval
      Wepay::Api::Preapproval.new
    end

    def withdrawal
      Wepay::Api::Withdrawal.new
    end

    def subscription_plan
      Wepay::Api::SubscriptionPlan.new
    end
  end
end
