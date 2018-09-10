class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @book = Book.find(params[:book_id])
  end

  def create
    @book_id = params[:book_id]
    @user_id = helpers.current_user.id
    @review = Review.create(review_params)
    binding.pry
    # redirect_to book_reviews_path(@book)
  end

  def index
    @reviews = Review.where(book_id: params[:book_id])
    @book = Book.find(params[:book_id])
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
      if @review.upate(review_params)
        redirect_to review_path(@review)
      else
        render 'edit'
      end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end


  private

  def review_params
    params.require(:review).permit(:user_id, :book_id, :content)
  end
end
