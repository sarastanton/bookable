class RatingsController < ApplicationController

  include ApplicationHelper
  before_action :require_login
  before_action :find_book_in_params
  before_action :find_user

  def new
    @rating = Rating.new(book_id: params[:book_id], user_id: helpers.current_user.id)
  end

  def create
    @rating = Rating.create(rating_params)
    if @rating.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @rating = Rating.find(params[:id])
    if @rating.user == current_user
      render 'edit'
    else
      redirect_to user_path(@user)
    end
  end

  def update
    @rating = Rating.find(params[:id])
      if @rating.update(rating_params)
        redirect_to user_path(@user)
      else
        render 'edit'
      end
  end

  private

  def rating_params
    params.require(:rating).permit(:user_id, :book_id, :value)
  end

end
