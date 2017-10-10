class StoreController < ApplicationController
  def index
    @restaurants = Restaurant.order(:name )
    @reviews = Review.order(:restaurant_id)
  end
end
