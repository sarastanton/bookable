module ApplicationHelper

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    session[:user_id] != nil
  end

  def require_login
    unless session.include? :user_id
      redirect_to '/'
      flash[:message] = "Must be signed in"
    end
  end


end
