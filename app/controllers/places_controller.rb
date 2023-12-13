class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index

    @places = Place.all
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR location  ILIKE :query"
      @places = @places.where(sql_subquery, query: "%#{params[:query]}%")
    end
    if params[:filters].present? || params[:ambiance].present?
      @places = @places.joins(:filter)
      if params[:filters].present?
        Filter::FOODFILTERS.each do |filter|
          if params[:filters].keys.include?(filter)
            @places = @places.where("filters.#{filter} = true")
          end
        end
        Filter::FEATUREFILTERS.each do |filter|
          if params[:filters].keys.include?(filter)
            @places = @places.where("filters.#{filter} = true")
          end
        end
      end
      if params[:ambiance].present?
        @places = @places.where("filters.ambiance = ?", params[:ambiance])
      end
    end

    respond_to do |format|
      format.html
      format.text { render partial: "place", locals: {places: @places}, formats: [:html] }
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
    @reviews = Review.where(place: @place)
  end

  private

  def places_params
    params.require(:place).permit(:name, :location, :description, :rating, :photos)
  end
end
