class FavoritesController < ApplicationController
  before_action :set_place, except: [ :destroy ]

  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.place_id = @place
    @favorite.save!
  end

  def destroy

  end

  private

  def set_place
   @place = Place.find(params[:place_id])
  end

end
