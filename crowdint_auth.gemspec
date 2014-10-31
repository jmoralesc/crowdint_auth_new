$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "crowdint_auth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "crowdint_auth"
  s.version     = CrowdintAuth::VERSION
  s.authors     = ["David Padilla"]
  s.email       = ["david@crowdint.com"]
  s.homepage    = "https://github.com/dabit/crowdint_auth"
  s.summary     = "Authenticate Rails apps with CrowdInt's Google Apps and Devise "
  s.description = "Authenticate Rails apps with CrowdInt's Google Apps and Devise "

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "devise", "~> 3.2.0"
  s.add_dependency "omniauth-google-oauth2"

  s.add_development_dependency 'rspec-rails'
end
