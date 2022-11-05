class ResultsController < ApplicationController
  def index
    @restaurants = RestaurantsFacade.restaurants
  end
end