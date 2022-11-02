class SessionsController < ApplicationController
  def create
    redirect_to dashboard_path
  end
end