class SettingsController < ApplicationController
	include SetUser

  before_action :authenticate_user!
  before_action :set_user, only: [:index, :update]

  def index
  end

  def update
  	if @user.update(setting_params)
  		flash[:notice] = "Settings was saved."
  	else
  		flash[:alert] = "Settings not save."
  	end
  	redirect_to settings_url
  end

  private
  	def setting_params
      params.require(:user).permit(:currency, :fisrt_dom)
    end
end
