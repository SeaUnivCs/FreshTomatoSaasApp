class MoviesController < ApplicationController
  def index
    #The message param allow pages redirecting to the index action to show some text message  at the bottom of the page
    @message = params[:message]
  	@movies = Movie.all
  end

  def show
  	#debugger
    id = params[:id]
    logger.debug("find movie " + params.inspect)
    @movie = Movie.find(id)
  end

  # This action would delete a movie
  def destroy
    id = params[:id]
    logger.debug("attempting to delete movie " + id)
    @movie = Movie.find(id)
    
    #only delete the file if it actually exist
    if defined? @movie
      logger.debug("movie exists. deleting it. ")
      Movie.delete(@movie)
    end

    #the delete requests are idempotent, so if we didn't find it, don't fail, just continue as if it was deleted

    #after deleting the record return to the index view and pass a message of the deleted movie
    redirect_to :action => "index", :message => "deleted movie '" + id + "'"
  end
end
