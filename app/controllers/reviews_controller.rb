class ReviewsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    # @book_id = @book.id
    # @user_id = helpers.current_user.id
    @review = Review.new(book_id: params[:book_id], user_id: helpers.current_user.id)
    binding.pry
  end

  def create
    @book = Book.find(params[:book_id])
    @user = User.find(helpers.current_user.id)
    @review = Review.create(review_params)
    binding.pry
    redirect_to book_reviews_path(@book)
  end

  def index
    @user = User.find(helpers.current_user.id)
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
