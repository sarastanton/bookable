class AuthorsController < ApplicationController

  include ApplicationHelper
  before_action :require_login
  before_action :find_author_in_params
  skip_before_action :find_author_in_params, only: [:new, :create]

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
    @authors = Author.all.sort_by(&:name)
  end

  def show

  end

  def edit

  end

  def update
    if @author.update(author_params)
      redirect_to author_path(@author)
    end
  end

  def destroy
    @author.destroy
  end

  private

  def author_params
    params.require(:author).permit(:name)
  end


  end
