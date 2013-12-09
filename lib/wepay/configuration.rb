module Wepay
  module Configuration
    attr_accessor :client_id, :client_secret, :access_token, :account_id, :scope, :using_stage

    ##
    # Time to wait for the connection to Wepay to open. After that
    # {Wepay::TimeoutError} is thrown.
    #
    attr_accessor :open_timeout

    ##
    # Time to wait for the first block of response from Wepay. After that
    # {Wepay::TimeoutError} is thrown.
    #
    attr_accessor :timeout

    def configure
      yield self
      self
    end

    def api_endpoint
      using_stage ? "https://stage.wepayapi.com/v2/" : "https://wepayapi.com/v2/"
    end

    def oauth_authorization_endpoint
      using_stage ? "https://stage.wepay.com/v2/oauth2/authorize" : "https://www.wepay.com/v2/oauth2/authorize"
    end

    def oauth_token_endpoint
      using_stage ? "https://stage.wepayapi.com/v2/oauth2/token" : "https://wepayapi.com/v2/oauth2/token"
    end
  end
end