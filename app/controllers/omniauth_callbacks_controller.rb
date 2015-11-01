class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :set_user

  def facebook
    omniauth_callback :facebook
  end

  def twitter
    omniauth_callback :twitter
  end

  private
    def set_user
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env["omniauth.auth"])
    end

    def omniauth_callback(provider)
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: provider.to_s.titleize) if is_navigational_format?
      else
        session["devise.#{provider.to_s}_data"] = provider.eql?(:facebook) ? request.env["omniauth.auth"] : request.env["omniauth.auth"].except("extra")
        redirect_to new_user_registration_url
      end
    end
end
