class FavoritesController < ApplicationController
  before_action :set_place, except: [ :destroy ]

  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.place = @place
    @favorite.save!
    redirect_to place_path(@place)

  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to place_path(@favorite.place)
  end

  private

  def set_place
   @place = Place.find(params[:place_id])
  end

end
