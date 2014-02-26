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
    @movie = Movie.new(params[:movie])
    if @movie.save
      flash[:notice] = "#{@movie.title} created successfully!"
      redirect_to movies_path
    else
      render 'new' # note, 'new' template can access @movie's field values!
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
    if @movie.update_attributes(params[:movie])
      flash[:notice] = "Updated '#{@movie.title}' successfully!"
      redirect_to movie_path(@movie)
    else
      render 'edit' # note, 'edit' template can access @movie's field values!
    end
  end

  # Delete a movie and redirect to the movies page.
  def destroy
    @movie = Movie.find params[:id]
    @movie.destroy
    flash[:notice] = "Deleted '#{@movie.title}'."
    redirect_to movies_path
  end
end
