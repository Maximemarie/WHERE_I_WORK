class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @places = Place.all
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR location  ILIKE :query"
      @places = @places.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  private

  def monument_params
    params.require(:place).permit(:name,:location,:description,:rating)
  end
end
