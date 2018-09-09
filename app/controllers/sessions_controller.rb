class SessionsController < ApplicationController

  def new
    @user = User.new
    render 'login'
  end

  def create
    if params[:user][:username] #user logs in with existing Bookable account
      @user = User.find_by(username: params[:user][:username])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        render 'login'
      end
    else #user logs in with Goodreads 
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.username = auth['info']['name']
      end
      session[:user_id] = @user.id
      redirect_to root_path
    end
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
