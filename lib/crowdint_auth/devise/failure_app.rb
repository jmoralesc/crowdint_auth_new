module CrowdintAuth
  module Devise
    class FailureApp < ::Devise::FailureApp
      def redirect_url
        google_apps_sign_in_path
      end
    end
  end
end
