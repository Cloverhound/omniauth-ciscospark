require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Ciscospark < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "ciscospark"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {:site => "https://api.ciscospark.com/v1/authorize"}
      option :scope, "spark%3Amessages_write%20spark%3Arooms_read%20spark%3Ateams_read%20spark%3Amemberships_read%20spark%3Amessages_read%20spark%3Arooms_write%20spark%3Apeople_read%20spark%3Akms%20spark%3Amemberships_write%20spark%3Ateams_write%20spark%3Ateam_memberships_read%20spark%3Ateam_memberships_write"

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['id'] }

      info do
        {
          :name => raw_info['name'],
          :email => raw_info['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/me').parsed
      end
    end
  end
end
