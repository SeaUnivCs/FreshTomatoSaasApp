class MoviesController < ApplicationController
	def index
		#@movies is available in views
		@movies = Movie.all
		logger.debug("MoviesController =================== #{params.inspect}")
	end
	def show
		@movie = Movie.find(params[:id])
		logger.debug("MoviesController Show =================== #{params.inspect}")
	end
	def new
                logger.debug("MoviesController new =================== #{params.inspect}")	
	end


	def destroy
		@movie = Movie.destroy(params[:id])
		logger.debug("MoviesController Destroy =================== #{params.inspect}")
		flash[:notice] = "#{@movie.title} was deleted!"
		redirect_to movies_path
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
                @movie = Movie.find(params[:id])
	end
	def update
                #debugger
                logger.debug("MoviesController create movie...........>#{params.inspect}")
		@movie = Movie.find params[:id]
                @movie.update_attributes!(movie_params)
                flash[:notice] = "Movie \"#{@movie.title}\" was successfully created."
                #instead of create a create view, we'd like to go to the movie list page after created a movie
                redirect_to movies_path
	end 
	private
	def movie_params
		params.require(:movie).permit(:title, :rating, :description, :release_date)
	end

end
