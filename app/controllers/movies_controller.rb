class MoviesController < ApplicationController
	before_action :find_movie, only:[:show, :edit, :update, :destroy]

	def show
		@lastmovies = Movie.last(6)
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new movie_params

		if @movie.save
			redirect_to @movie , notice: "Başarılya Oluşturuldu"
		else
			render 'new'
		end

	end

	def edit
	end

	def update
		if @movie.update(movie_params)
			redirect_to @movie , notice: "Film Güncellendi"
		else
			render 'edit'
		end
	end

	def index
		@movies = Movie.all
	end

	def destroy
		@movie.destroy
		redirect_to root_path, notice: "Başarıyla Silindi"
	end


	def movie_params
		params.require(:movie).permit(:title, :description, :date, :director, :country, :image)
	end

	def find_movie
		@movie = Movie.find(params[:id])
	end


end
