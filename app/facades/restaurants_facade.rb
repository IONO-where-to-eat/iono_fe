class RestaurantsFacade
  def self.restaurants(filter_params = nil)
    restaurants = BackendService.get_restaurants(filter_params)
    binding.pry
    restaurants[:businesses].each do |restaurant|
      Restaurant.new(restaurant)
    end
  end
end