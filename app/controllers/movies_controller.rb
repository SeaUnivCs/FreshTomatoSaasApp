# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  # in app/controllers/movies_controller.rb
  def show
  	id = params[:id] # retrieve movie ID from URI route
  	@movie = Movie.find(id) # look up movie by unique ID
  	# will render app/views/movies/show.html.haml by default
  end

  def new
  	# default: render 'new' template
  end

  def destroy
  	@movie = Movie.find(params[:id])
  	@movie.destroy
  	flash[:notice] = "Movie '#{@movie.title}' deleted"
  	redirect_to movies_path
  end

  def create
  	@movie = Movie.create!(params[:movie])
  	flash[:notice] = "#{@movie.title} was succesfully created."
  	redirect_to movies_path
  end

end