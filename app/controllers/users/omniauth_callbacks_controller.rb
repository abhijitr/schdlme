require 'pp'

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_hybrid
	pp env["omniauth.auth"]
	@user = User.find_for_open_id(env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end 
  end
end
