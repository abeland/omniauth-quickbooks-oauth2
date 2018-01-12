lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth-quickbooks-oauth2/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-quickbooks-oauth2"
  spec.version       = OmniAuth::QuickbooksOauth2::VERSION
  spec.authors       = ["Abe Land"]
  spec.email         = ["codeclimbcoffee@gmail.com"]

  spec.summary       = 'OAuth2 Omniauth strategy for Quickbooks.'
  spec.description   = 'OAuth2 Omniauth straetgy for Quickbooks (Intuit) API.'
  spec.homepage      = 'https://github.com/abeland/omniauth-quickbooks-oauth2'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'omniauth', '~>1.3'
  spec.add_dependency 'omniauth-oauth2', '~>1.5'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3"
end
