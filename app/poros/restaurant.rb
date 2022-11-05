class Restaurant 
  attr_reader :id, :name, :image_url, :is_closed, :url, :review_count, :categories, :rating, :transactions, :price, :location, :display_phone, :distance

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @image_url = data[:image_url]
    @is_closed = data[:is_closed]
    @url = data[:url]
    @review_count = data[:review_count]
    @categories = data[:categories].map { |category| category[:title] }
    @rating = data[:rating]
    @transactions = data[:transactions]
    @price = data[:price]
    @location = data[:location][:display_address]
    @display_phone = data[:display_phone]
    @distance = (data[:distance] / 1609).round(2)
  end
end
