class RestaurantsFacade
  def self.restaurants(filter_params = nil)
    restaurants = BackendService.get_restaurants(filter_params)
    restaurant_objects = restaurants[:businesses].map do |restaurant|
      Restaurant.new(restaurant)
    end
    # restaurant_objects.shuffle
  end
end