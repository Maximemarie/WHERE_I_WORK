class ReviewsController < ApplicationController
  before_action :set_place, except: [ :destroy, :index ]

  def create
    @review = Review.new(review_params)
    @review.place = @place
    if @review.save
      redirect_to place_path(@place)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @review = Review.new
  end

  def index
    @places = Place.where(user_id: current_user)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to place_path(@review.place)
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end

end
