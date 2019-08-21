class ReviewsController < ApplicationController
  before_action :fetch_restaurant
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.save
    if @review.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end

  # Get restaurant ID from the URL
  def fetch_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
