class SessionsController < ApplicationController
  def create
    user = BackendService.register_user(user_params)
    user_id = user[:data][:attributes][:google_id]
    session[:user_id] = user_id
    session[:email] = user[:data][:attributes][:email]
    redirect_to dashboard_path(user_id)
  end

  def logout
    session.delete :user_id
    session.delete :email
    redirect_to root_path
  end

private

  def auth_hash
    request.env['omniauth.auth']
  end

  def user_params
    {
    google_id: auth_hash['uid'],
    email: auth_hash['info']['email'],
    token: auth_hash['credentials']['token']
    }
  end
end