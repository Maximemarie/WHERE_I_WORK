class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @places = Place.all
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR location  ILIKE :query"
      @places = @places.where(sql_subquery, query: "%#{params[:query]}%")
    end
    # The `geocoded` scope filters only flats with coordinates
    @markers = @places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        info_window_html: render_to_string(partial: "places/places_window", locals: { place: place }),
        marker_html: render_to_string(partial: "marker", locals: {place: place})
      }
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  private

  def places_params
    params.require(:place).permit(:name,:location,:description,:rating)
  end
end
