class GenresController < ApplicationController

  include ApplicationHelper
  before_action :require_login
  before_action :find_genre_in_params
  skip_before_action :find_genre_in_params, only: [:new, :create]

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

  end

  def edit

  end

  def update
    redirect_to genre_path(@genre) if @genre.update(genre_params)
  end

  def destroy
    @genre.destroy
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
