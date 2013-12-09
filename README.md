# wepay-api

`wepay-api` is a Ruby wrapper for Wepay API.

## Installation

Add this line to your application's Gemfile:

    gem 'wepay-api'

Or install it yourself as:

    $ gem install wepay-api

## Configuration
`wepay-api` can be configured as following:

```
Wepay.configure do |config|
  config.client_id     = ...  # app id                                  (compulsory)
  config.client_secret = ...  # app secret                              (compulsory)
  config.access_token  = ...  # access token of the app                 (compulsory)
  config.account_id    = ...  # caller's account id                     (compulsory)
  config.scope         = ...  # the permission for OAuth authorization  (compulsory)
  config.using_stage   = ...  # set to true/false                       (compulsory)
  config.open_timeout  = 5    # default is 5 seconds                    (optional)
  config.timeout       = 10   # default is 10 seconds                   (optional)
end
```

## Usage

### OAuth
#### OAuth authorization URL
To get the authorization URL for OAuth, use following method:

```
Wepay.authorization_url(redirect_uri)
```

Refer to [https://stage.wepay.com/developer/reference/oauth2#authorize](https://stage.wepay.com/developer/reference/oauth2#authorize) for more details.

#### User's access token
To get the access token from user, use following method:

```
Wepay.get_access_token(code, redirect_uri)
```

Refer to [https://stage.wepay.com/developer/reference/oauth2#token](https://stage.wepay.com/developer/reference/oauth2#token) for more details.

### API
#### Available API
  - [/account](https://github.com/burnsidedigital/wepay-api/blob/master/lib/wepay/api/account.rb)
  - [/checkout](https://github.com/burnsidedigital/wepay-api/blob/master/lib/wepay/api/checkout.rb)

#### API calls
In order to make an API call, we can follow the convention for the method call:

Wepay.`api_type`.`api_method`(params)

For example, to create a checkout:

```
Wepay.checkout.create(
  short_description:	"my description for the checkout",
  type:               "GOODS",
  fee_payer:          "payee",
  amount:	            10,
  redirect_uri:       "redirect_uri",
  ...
```

`params` is a Hash which captures the whole query as in Wepay API documentation, so refer to the documentation if any doubts.

Response from these API calls will be converted to `Hashied::Mash` object to make it easier for data accessing.
Refer to [https://github.com/intridea/hashie#mash](https://github.com/intridea/hashie#mash) for more details.

#### User's authorized calls
After configured, the http client from `wepay-api` will try to make user of `access_token` as the default authorization of the api calls.
There are some situations that user's `access_token` need to be used, e.g. create an account for the user, so we can embed the user's `access_token`
in the call by adding field `access_token` to the params, for example:

```
Wepay.checkout.create(
  ...
  access_token:   "user's access token"
)
```

#### Error/ Exception
If an API call has errors, it will raise an Wepay::ApiError with following fields:
  - type,     e.g. invalid_request
  - code,     e.g. 1001
  - message

Give a rescue block to the API calls to make sure the error is handled in any situation.

## Development notes
  - Copy `spec/settings.yml.example` into `spec/settings.yml` and replace with your credentials to make record the requests for testing using VCR
  - Before committing VCR fixtures, remember to remove any sensitive data from the fixtures: account id, client secret, ...

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
