class MoviesController > ApplicationController
	def index
		#@movies is available in views
		@movies = Movie.all
	end
	def show
		id = params[:id]
		@movie = Movie.find(id)
	end
end