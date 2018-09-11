class GenresController < ApplicationController

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(genre_params)
    if @genre.save
      redirect_to genre_path(@genre)
    else
      render 'new'
    end
  end

  def index
    @genres = Genre.all.sort_by(&:name)
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to genre_path(@genre)
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
