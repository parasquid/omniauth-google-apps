require 'omniauth-openid'
require 'openid/gapps'

module OmniAuth
  module Strategies
    class GoogleApps < OmniAuth::Strategies::OpenID
      option :name, "google_apps"
      option :domain, nil

      def get_identifier
        f = OmniAuth::Form.new(:title => 'Google Apps Authentication')
        f.label_field('Google Apps Domain', 'app_domain')
        f.input_field('url', 'app_domain')
        f.to_response
      end

      def identifier
        options[:domain] || request['app_domain']
      end
    end
  end
end
