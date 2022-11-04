class ResultsController < ApplicationController
  def index
    @restaurants = RestaurantsFacade.restaurants
    binding.pry
  end
end