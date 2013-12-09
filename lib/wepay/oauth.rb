require 'uri'

module Wepay
  module OAuth
    ##
    # @param redirect_uri [String] The uri the user will be redirected to after authorization. Must have the same domain as the application.
    # @return [String] URL to redirect user to Wepay Authorization page
    #
    def authorization_url(redirect_uri)
      url = URI.parse(Wepay.oauth_authorization_endpoint)

      query = {
        client_id:    Wepay.client_id,
        scope:        Wepay.scope,
        redirect_uri: redirect_uri
      }

      url.query = query.map { |k, v| "#{k}=#{v}" }.join("&")
      url.to_s
    end

    ##
    # @param code [String] The authorization code used to get the access token
    # @param redirect_uri [String] The uri the user was redirected to after authorization. Must be the same as passed in /oauth2/authorize
    # @return [Hashie::Mash]
    #
    def get_access_token(code, redirect_uri)
      client = Wepay::Client::Token.new
      client.get_access_token(code, redirect_uri)
    end
  end
end