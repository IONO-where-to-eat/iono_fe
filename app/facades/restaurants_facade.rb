class RestaurantsFacade
  def self.restaurants(filter_params = nil)
    restaurants = BackendService.get_restaurants(filter_params)
    if !restaurants[:businesses].empty?
      restaurant_objects = restaurants[:businesses].map do |restaurant|
        Restaurant.new(restaurant)
      end
      restaurant_objects.shuffle
    else
      []
    end
  end
end
