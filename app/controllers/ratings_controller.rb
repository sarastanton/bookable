class RatingsController < ApplicationController

  def new
    @rating = Rating.new
  end
  
end
