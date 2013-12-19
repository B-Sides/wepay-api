# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wepay/version'

Gem::Specification.new do |spec|
  spec.name          = "wepay-api"
  spec.version       = Wepay::VERSION
  spec.authors       = ["Anh Nguyen"]
  spec.email         = ["anguyen@burnsidedigital.com"]
  spec.description   = %q{Ruby Wrapper for Wepay API}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/B-Sides/wepay-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday",              ">= 0.7.6"
  spec.add_dependency "faraday_middleware",   ">= 0.8"
  spec.add_dependency "hashie",               ">= 2.0.0"

  spec.add_development_dependency "bundler",  "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec",    ">= 2"
  spec.add_development_dependency "vcr",      ">= 2"
end
