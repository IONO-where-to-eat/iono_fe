class ResultsController < ApplicationController
  def index
    if session[:user_id]
      filter_params = {radius: params[:radius], open_now: params[:open_now], price: params[:price], transactions: params[:transactions]}
      return_restaurants = RestaurantsFacade.restaurants(filter_params)
      if return_restaurants.empty?
        flash[:error] = 'No restaurants match your filters. Please refine your search.'
        redirect_to dashboard_path(session[:user_id])
      else
        @restaurants = return_restaurants
      end
    else
      return_restaurants = restaurants
      if return_restaurants.empty?
        flash[:error] = 'No restaurants found. Please login to refine your search.'
        redirect_to root_path
      else
        @restaurants = return_restaurants
      end
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