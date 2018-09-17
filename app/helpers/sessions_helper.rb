module SessionsHelper

  def login_status_display
		if logged_in?
			username = User.find_by(id: session[:user_id]).username
			login_status = "You are logged in as #{username} "
		else
			login_status = "You are NOT logged in"
		end
	end

end
