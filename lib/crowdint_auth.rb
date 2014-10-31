require "crowdint_auth/engine"
require "devise"
require "omniauth-google-oauth2"

module CrowdintAuth
  autoload :Devise, 'crowdint_auth/devise/failure_app'
end
