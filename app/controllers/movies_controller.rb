class MoviesController < ApplicationController
  def index
  	@movies = Movie.all
  end

  def show
  	debugger
    id = params[:id]
    logger.debug("find movie " + params.inspect)
    @movie = Movie.find(id)

  end

  def new
  end

end
