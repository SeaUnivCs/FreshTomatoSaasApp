class MoviesController < ApplicationController

	def index
		@movies = Movie.all
	end

	def show
		id = params[:id]
		@movie = Movie.find(id)
	end

	def destroy
		id = params[:id]
		@movie = Movie.find(id)
		@movie.destroy
		flash[:notice] = "'#{@movie.title}' deleted."
		redirect_to movies_path
	end
end
