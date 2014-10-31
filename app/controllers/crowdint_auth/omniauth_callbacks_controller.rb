class CrowdintAuth::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :verify_authenticity_token

  def user_class
    ::User
  end

  def create_user_record(email, name)
    user_class.create(:email => email, :name => name)
  end

  def google_oauth2
    auth_hash = request.env['omniauth.auth']
    email = auth_hash.info['email']

    user = user_class.find_by_email(email)
    user ||= create_user_record(email, auth_hash.info['name'])

    if user.persisted?
      sign_in_and_redirect user
    end
  end

  def google_apps_sign_in
    redirect_to user_omniauth_authorize_path :google_oauth2
  end
end
