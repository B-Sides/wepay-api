module Wepay
  module Api
    def account
      Wepay::Api::Account.new
    end

    def checkout
      Wepay::Api::Checkout.new
    end
  end
end
