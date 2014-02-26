# app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  # Show the new movie form
  def new
    # calls new.html.haml by default
  end
  
  # Create a new movie with given info from 'new' form
  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "Created #{@movie.title}!"
    redirect_to movies_path
  end

  # Show a single movie page
  def show
    id = params[:id]
    @movie = Movie.find(id)
  end
  
  # Show the edit form for a movie
  def edit
    @movie = Movie.find params[:id]
  end

  # Update a movie with given info from 'edit' form
  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "Updated '#{@movie.title}' successfully!"
    redirect_to_movie_path(@movie)
  end

  # Delete a movie
  def destroy
    @movie = Movie.find params[:id]
    @movie.destroy
    flash[:notice] = "Deleted '#{@movie.title}'."
    redirect_to movies_path
  end
end
