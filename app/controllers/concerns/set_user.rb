module SetUser
	extend ActiveSupport::Concern
	
	private
		def set_user
		  @user = current_user
		end
end