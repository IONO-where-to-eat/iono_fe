class SessionsController < ApplicationController
  def create
    user = BackendService.register_user(user_params)
    # user = User.find_or_create_by(email: user_params[:email])
    # user.update(user_params)
    # binding.pry
    session[:user_id] = user[:data][:google_id]

    redirect_to dashboard_path(user)
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