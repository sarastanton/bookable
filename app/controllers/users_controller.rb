class UsersController < ApplicationController

  def new
    @user = User.new
    render 'signup'
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'signup'
    end
  end

  def show
    @user = User.find(params[:id])
    render 'profile'
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
