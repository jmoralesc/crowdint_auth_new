Rails.application.routes.draw do

  mount CrowdintAuth::Engine => "/crowdint_auth"
end
