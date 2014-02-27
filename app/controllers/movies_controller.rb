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
end
