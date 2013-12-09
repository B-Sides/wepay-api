require 'bundler/setup'
require 'wepay-api'

Dir["./spec/support/**/*.rb"].each &method(:require)

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.expect_with(:rspec) {|c| c.syntax = :expect}
  config.order = :random

  config.include RspecHelper
end