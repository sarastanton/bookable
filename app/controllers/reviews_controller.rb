class ReviewsController < ApplicationController

  include ApplicationHelper
  before_action :require_login
  before_action :find_book_in_params
  before_action :find_user


  def new
    @review = Review.new(book_id: params[:book_id], user_id: helpers.current_user.id)
  end

  def create
    @review = Review.create(review_params)
    if @review.save
      if ReadStatus.find_by(user_id: @user.id, book_id: @book.id) == nil
        @book.add_to_my_books(@user)
        @book.mark_as_read(@user)
      end
      redirect_to book_reviews_path(@book)
    else
      render 'new'
    end

  end

  def index
    @reviews = Review.where(book_id: params[:book_id])
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
    if @review.user == current_user
      render 'edit'
    else
      redirect_to book_reviews_path(@book)
    end

  end

  def update
    @review = Review.find(params[:id])
      if @review.update(review_params)
        redirect_to book_reviews_path(@book)
      else
        render 'edit'
      end
  end

  def destroy
    if @review.user == current_user
      @review = Review.find(params[:id])
      @review.destroy
    end
    redirect_to book_reviews_path(@book)
  end


  private

  def review_params
    params.require(:review).permit(:user_id, :book_id, :content)
  end
end
