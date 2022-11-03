require "faraday"
require "json"

class BackendService
  def self.register_user(user_params)
    response = conn.post('/api/v1/users') do |req|
      req.body = user_params.to_json
    end
    parse(response)
  end

  private

  def self.conn
    Faraday.new(url: 'http://localhost:5000', headers: { 'Content-Type' => 'application/json' })
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end