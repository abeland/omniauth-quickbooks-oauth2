# omniauth-quickbooks-oauth2

This gem provides an Omniauth strategy to connect with Quickbooks (via Intuit) using OAuth2.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-quickbooks-oauth2'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-quickbooks-oauth2

## Usage

In your omniauth initializer file (e.g. `config/initializers/omniauth.rb`), you will want to add the following:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  ...
  provider(
    :quickbooks_oauth2,
    ENV['INTUIT_CLIENT_ID'],
    ENV['INTUIT_CLIENT_SECRET'],
    scope: 'com.intuit.quickbooks.accounting openid profile email phone address',
    sandbox: Rails.env.development?,
  )
  ...
end
```

**NOTE: The above environment variable names and scope are just what I use in my particular project. The environment variables can be named whatever and you should consult [Intuit's documentation](https://developer.intuit.com/docs/00_quickbooks_online/2_build/10_authentication_and_authorization/10_oauth_2.0#/Initiating_the_authorization_request) to figure out which scopes your application should ask for.**

**ALSO NOTE: If the `sandbox` parameter is not explicitly set to `false`, then the strategy will default to using the sandbox endpoints for Intuit's API.**

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/abeland/omniauth-quickbooks-oauth2.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
