module Wepay
  ##
  # Client for getting access token from Wepay's oauth endpoint.
  #
  class Client::Token < Client
    def get_access_token(code, redirect_uri)
      params = {
        client_id:      client_id,
        client_secret:  client_secret,
        code:           code,
        redirect_uri:   redirect_uri
      }

      get '', params
    end

    private
    def url
      Wepay.oauth_token_endpoint
    end

    def client_id
      Wepay.client_id
    end

    def client_secret
      Wepay.client_secret
    end
  end
end