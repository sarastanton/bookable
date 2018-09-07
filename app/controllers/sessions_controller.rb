class SessionsController < ApplicationController

  def new
    @user = User.new
    render 'login'
  end

  def create
    @user = User.find_by(params[:user][:username])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'login'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
