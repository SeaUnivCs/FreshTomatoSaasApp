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
		Movie.find(id).destroy
		redirect_to movies_path
	end
end
