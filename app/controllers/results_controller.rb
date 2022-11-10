class ResultsController < ApplicationController
  def index
    if session[:user_id]
      session_restaurants
    else
      user_restaurants
    end
  end

  def user_restaurants
    return_restaurants = restaurants
    if return_restaurants.empty?
      flash[:error] = 'No restaurants found. Please login to refine your search.'
      redirect_to root_path
    else
      @restaurants = return_restaurants
    end
  end

  def session_restaurants
    filter_params = {
      radius: params[:radius],
      open_now: params[:open_now],
      price: params[:price],
      transactions: params[:transactions]
    }
    return_restaurants = restaurants(filter_params)
    if return_restaurants.empty?
      flash[:error] = 'No restaurants match your filters. Please refine your search.'
      redirect_to dashboard_path(session[:user_id])
    else
      @restaurants = return_restaurants
    end
  end

  def shuffle
    restaurants.shift
    redirect_to results_path
  end

  def restaurants(filter_params = nil)
    RestaurantsFacade.restaurants(filter_params)
  end
end
