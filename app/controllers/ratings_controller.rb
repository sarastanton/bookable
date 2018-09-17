class RatingsController < ApplicationController

  include ApplicationHelper
  before_action :require_login

  def new
    @rating = Rating.new(book_id: params[:book_id], user_id: helpers.current_user.id)
    @book = Book.find(params[:book_id])
  end

  def create
    @book = Book.find(params[:book_id])
    @user = User.find(helpers.current_user.id)
    @rating = Rating.create(rating_params)
    if @rating.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:user_id, :book_id, :value)
  end

end
