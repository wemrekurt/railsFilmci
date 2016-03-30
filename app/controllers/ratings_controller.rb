class RatingsController < ApplicationController
  before_action :authenticate_user!, only:[:create]

  def create
    @rating = Rating.new rating_params
    @rating.user_id = current_user.id
    if @rating.save
      redirect_to root_path, notice: "Oyunuz kaydedildi"
    else
    
    end
  end


  def rating_params
    params.require(:rating).permit(:movie_id , :point)
  end
end
