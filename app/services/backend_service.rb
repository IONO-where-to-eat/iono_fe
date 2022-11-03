require "faraday"
require "json"

class BackendService
  def self.register_user(user_params)
    # binding.pry
    # conn.post("/api/v1/users")
    # Faraday.new(url: "http://localhost:5000/api/v1/users", body = {google_id: user_params[:google_id], email: user_params[:email], token: user_params[:token]}.to_json)
    conn.post('/api/v1/users') do |req|
      # req.body = {google_id: user_params[:google_id], email: user_params[:email], token: user_params[:token]}.to_json
      # req.params = {google_id: user_params[:google_id], email: user_params[:email], token: user_params[:token]}.to_json
      var = req.body = user_params.to_json
      binding.pry
    end
  end

  private

  def self.conn
    Faraday.new(url: 'http://localhost:5000', headers: { 'Content-Type' => 'application/json' })
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end