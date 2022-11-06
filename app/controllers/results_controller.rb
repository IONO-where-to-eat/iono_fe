class ResultsController < ApplicationController
  def index
    if session[:user_id]
      filter_params = {radius: params[:radius], open_now: params[:open_now], price: params[:price], transactions: params[:transactions]}
      @restaurants = RestaurantsFacade.restaurants(filter_params)
    else
      @restaurants = restaurants
    end
  end

  def shuffle
    @restaurants = restaurants.shift
    redirect_to results_path
  end

  def restaurants
    @restaurants ||= RestaurantsFacade.restaurants(filter_params = nil)
  end
end