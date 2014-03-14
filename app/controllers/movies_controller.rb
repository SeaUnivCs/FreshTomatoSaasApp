class MoviesController < ApplicationController
  def index
  #movies is available in views
  @movies = Movie.all
  end

  def show
  id =params[:id]
  @movie = Movie.find(id)
  end

  def destroy
  @movie = Movie.find(params[:id]).destroy
  flash[:notice] = "Movie '#{@movie.title}' deleted."
  redirect_to movies_path
  end
 
  def new
  end

  def create
   #debugger
    logger.debug("MoviesController create movie...........>#{params.inspect}")
    @movie = Movie.create!(movie_params)
    flash[:notice] = "Movie \"#{@movie.title}\" was successfully created."
    #instead of create a create view, we'd like to go to the movie list page after created a movie
    redirect_to movies_path
  end

 def edit
    id =params[:id]
    @movie = Movie.find(id)
  end

  def update
   #debugger
    logger.debug("MoviesController create movie...........>#{params.inspect}")
    id =params[:id]
    @movie = Movie.find(id)
    @movie.update_attributes!(movie_params)
    flash[:notice] = "Movie \"#{@movie.title}\" was successfully updated."
    #instead of create a create view, we'd like to go to the movie list page after created a movie
    redirect_to movies_path(@movie)
  end
 
 private
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
 
end
