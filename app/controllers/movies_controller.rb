# app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  # Show the new movie form
  def new
    @movie = Movie.new
  end
  
  # Create a new movie with given info from 'new' form and
  # redirect to movies page on success.
  def create
    @movie = Movie.new(movie_params)
    temp = @movie.title.squeeze(" ").strip().titleize()
    @movie.title = temp
    if @movie.save
      flash[:notice] = "#{@movie.title} was successfully created."
      redirect_to movies_path
    else
      # Create failed, re-render the form
      render 'new'
    end
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

  # Update a movie with given info from 'edit' form and redirect
  # to the movie's page.
  def update
    @movie = Movie.find params[:id]
    temp = @movie.title.squeeze(" ").strip().titleize()
    @movie.title = temp
    if @movie.update_attributes(movie_params)
      flash[:notice] = "#{@movie.title} was successfully updated."
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end

  # Delete a movie and redirect to the movies page.
  def destroy
    @movie = Movie.find params[:id]
    @movie.destroy
    flash[:notice] = "Deleted '#{@movie.title}'."
    redirect_to movies_path
  end

  # Define movie parameters for validation
  private
  def movie_params
    params.require(:movie).permit(:title, :rating, :release_date, :description)
  end
end
