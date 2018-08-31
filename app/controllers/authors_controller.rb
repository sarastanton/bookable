class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    @author = Author.create(author_params)
    if @author.save
      redirect_to author_path(@author)
    else
      render 'new'
    end
  end

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      redirect_to author_path(@author)
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
  end

  private

  def author_params
    params.require(:author).permit(:name)
  end


  end
