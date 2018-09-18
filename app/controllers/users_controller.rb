class UsersController < ApplicationController

  include ApplicationHelper
  include UsersHelper

  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    if !logged_in?
      @user = User.new
      render 'signup'
    else
      redirect_to root_path
    end
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
    if params[:mark_as_read]
      @book = Book.find(params[:book_id])
      @book.mark_as_read(@user)
    end
    pages_read_by_user(@user)
    render 'profile'
  end

  def index

  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
