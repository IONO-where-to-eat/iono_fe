class SessionsController < ApplicationController
  def create
    user = BackendService.register_user(user_params)
    session[:user_id] = user.id

    redirect_to dashboard_path(user)
  end

private

  def auth_hash
    auth_hash = request.env['omniauth.auth']
  end

  def user_params
    {
    google_id: auth_hash['uid'],
    email: auth_hash['info']['email'],
    token: auth_hash['credentials']['token']
    }
  end
end