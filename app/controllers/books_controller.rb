class BooksController < ApplicationController

  include ApplicationHelper
  before_action :require_login
  before_action :find_user
  before_action :find_book_in_params
  skip_before_action :find_book_in_params, only: [:new, :create]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new
    @book = Book.create(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  def index
    @books = Book.all.sort_by(&:title)
    if params[:add_to_my_books]
      @book.add_to_my_books(@user)
      render 'index'
    end
  end

  def show
    
  end

  def edit

  end

  def update
    redirect_to book_path(@book) if @book.update(book_params)
  end

  def destroy
    @book.destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :author_name, :genre_name, :page_count)
  end


end
