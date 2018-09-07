class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new
    # @book.author = Author.find_or_create_by(name: params[:book][:author]) if params[:book][:author] != ""
    # @book.genre = Genre.find_or_create_by(name: params[:book][:genre]) if params[:book][:genre] != ""
    @book = Book.create(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :author_name, :genre_name, :page_count)
  end


end
