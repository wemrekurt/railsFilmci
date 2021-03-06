class MoviesController < ApplicationController
	before_action :find_movie, only:[:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only:[:new, :create]

	def show
		@lastmovies = Movie.last(6)
		@rating = Rating.new
		# Son 6 kayıtı listele sorgusu böyle :)
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

	def filter
		@movies = Movie.all.where(country: params[:country])
	end


	def movie_params
		params.require(:movie).permit(:title, :description, :date, :director, :country, :image)
	end

	def find_movie
		@movie = Movie.find(params[:id])
	end


end
