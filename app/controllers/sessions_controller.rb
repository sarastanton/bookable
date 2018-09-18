class SessionsController < ApplicationController

  include SessionsHelper
  include ApplicationHelper

  before_action :require_login
  skip_before_action :require_login, only: [:new, :create, :index]


  def new
    if logged_in?
      redirect_to root_path
    else
      @user = User.new
      render 'login'
    end
  end

  def create
    if params[:user] != nil #user logs in with existing Bookable account
      login_with_bookable
    else #user logs in with Goodreads
      login_with_goodreads
    end
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
