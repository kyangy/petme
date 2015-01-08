module SessionsHelper

	def logged_in?
		session[:user_id] != nil
	end	

	def not_signed_up
		session[:user_id] == nil
	end

end
