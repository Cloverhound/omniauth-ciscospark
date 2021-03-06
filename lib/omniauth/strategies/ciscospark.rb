require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Ciscospark < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "ciscospark"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        :site          => 'https://api.ciscospark.com',
        :authorize_url => '/v1/authorize',
        :token_url     => '/v1/access_token'
      }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.

      uid { raw_info['id'] }

      info do
        hash = {
          nickname: raw_info['displayName'],
          avatar: raw_info['avatar'],
          emails: raw_info['emails'],
          id: raw_info['id']
        }

        hash
      end

      def raw_info
        @raw_info ||= access_token.get('/v1/people/me').parsed
      end

      def callback_url
       options[:callback_url] || full_host + script_name + callback_path
      end

    end
  end
end
