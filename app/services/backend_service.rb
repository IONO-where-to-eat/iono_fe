require "faraday"
require "json"

class BackendService
  def self.register_user(user_params)
    response = conn.post('/api/v1/users') do |req|
      req.body = user_params.to_json
    end
    parse(response)
  end

  def self.get_restaurants(search_params = nil)
    response = conn.get('/api/v1/restaurants') do |req|
      req.body = search_params.to_json
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