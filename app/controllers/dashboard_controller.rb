class DashboardController < ApplicationController
  def show
    @user_id = session[:user_id]
    @user_email = session[:email]
  end
end
