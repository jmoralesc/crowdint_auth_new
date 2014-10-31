require 'devise'

Devise.setup do |config|
  config.omniauth :google_oauth2, ENV["GOOGLE_ID"], ENV["GOOGLE_SECRET"], { :hd => "crowdint.com" }

  config.warden { |manager| manager.failure_app = CrowdintAuth::Devise::FailureApp }
end