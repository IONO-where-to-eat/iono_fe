class BackendService
  def self.register_user(user_params)
    response = conn.post('/api/v1/users') do |req|
      req.body = user_params.to_json
    end
    parse(response)
  end

  def self.get_restaurants(filter_params = nil)
    Rails.cache.fetch('restaurant-search', expires_in: 5.minutes) do
      response = conn.get('/api/v1/restaurants', params = filter_params)
      parse(response)
    end
  end

  def self.conn
    if Rails.env.production?
      Faraday.new(url: 'https://boiling-lake-88809.herokuapp.com', headers: { 'Content-Type' => 'application/json' })
    else
      Faraday.new(url: 'http://localhost:5000', headers: { 'Content-Type' => 'application/json' })
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private_class_method :conn, :parse
end
