require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class QuickbooksOauth2 < OmniAuth::Strategies::OAuth2
      option :name, :quickbooks_oauth2

      option(
        :client_options,
        {
          site: 'https://appcenter.intuit.com/connect/oauth2',
          authorize_url: 'https://appcenter.intuit.com/connect/oauth2',
          token_url: 'https://oauth.platform.intuit.com/oauth2/v1/tokens/bearer',
        },
      )

      uid { request.params['realmId'] }

      info do
        raw_info
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= options.scope.split(/\s+/).include?('openid') ?
          JSON.parse(access_token.get("https://#{accounts_domain}/v1/openid_connect/userinfo").body) :
          {}
      end

      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end
      
      def request_phase
        log :info, "\n....REQUEST PHASE.\n..request.params..#{request.params}.\n..authorize_params...#{authorize_params}.......\n"
        super
      end

      def callback_phase 
        error = request.params["error_reason"] || request.params["error"]
        log :info, "\n....CALLBACK PHASE.\n..error..#{error.inspect}..\n"
        super
      end

      private

      def build_access_token
        verifier = request.params["code"]
        log :info, "\n....build_access_token method.\n...request.params....#{request.params}...\n"  
        super
      end

      def accounts_domain
        false == options.sandbox ? 'accounts.platform.intuit.com' : 'sandbox-accounts.platform.intuit.com'
      end
    end
  end
end
