class ResultsController < ApplicationController
  def index
    @restaurants = restaurants
  end

  def shuffle
    @restaurants = restaurants.shift
    redirect_to results_path
  end

  def restaurants
    @restaurants ||= RestaurantsFacade.restaurants
  end
end