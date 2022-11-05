require 'rails_helper'

RSpec.describe Restaurant do
  it 'exists' do
    restaurant_data = {
      "id": "L_FJzMcyQFsnNuA1rsCfxA",
      "alias": "tamarind-indian-cuisine-castle-rock",
      "name": "Tamarind Indian Cuisine",
      "image_url": "https://s3-media1.fl.yelpcdn.com/bphoto/fG5t0NQHS9xEVmWioFzklw/o.jpg",
      "is_closed": false,
      "url": "https://www.yelp.com/biz/tamarind-indian-cuisine-castle-rock?adjust_creative=HXaFGsDa_NpgBlPglTMuTA&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=HXaFGsDa_NpgBlPglTMuTA",
      "review_count": 470,
      "categories": [
          {
              "alias": "indpak",
              "title": "Indian"
          }
      ],
      "rating": 4.5,
      "coordinates": {
          "latitude": 39.37494,
          "longitude": -104.85835
      },
      "transactions": [
          "pickup",
          "delivery"
      ],
      "price": "$$",
      "location": {
          "address1": "514 Perry St",
          "address2": 'null',
          "address3": "",
          "city": "Castle Rock",
          "zip_code": "80104",
          "country": "US",
          "state": "CO",
          "display_address": [
              "514 Perry St",
              "Castle Rock, CO 80104"
          ]
      },
      "phone": "+17207330776",
      "display_phone": "(720) 733-0776",
      "distance": 363.69836433401923
  }

  restaurant = Restaurant.new(restaurant_data)

  expect(restaurant).to be_a Restaurant
  expect(restaurant.id).to eq('L_FJzMcyQFsnNuA1rsCfxA')
  expect(restaurant.name).to eq('Tamarind Indian Cuisine')
  expect(restaurant.image_url).to eq('https://s3-media1.fl.yelpcdn.com/bphoto/fG5t0NQHS9xEVmWioFzklw/o.jpg')
  expect(restaurant.is_closed).to eq(false)
  expect(restaurant.url).to eq('https://www.yelp.com/biz/tamarind-indian-cuisine-castle-rock?adjust_creative=HXaFGsDa_NpgBlPglTMuTA&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=HXaFGsDa_NpgBlPglTMuTA')
  expect(restaurant.review_count).to eq(470)
  expect(restaurant.categories).to eq([{ "alias": "indpak", "title": "Indian" }])
  expect(restaurant.rating).to eq(4.5)
  expect(restaurant.transactions).to eq(["pickup", "delivery"])
  expect(restaurant.price).to eq('$$')
  expect(restaurant.location).to eq(["514 Perry St", "Castle Rock, CO 80104"])
  expect(restaurant.display_phone).to eq('(720) 733-0776')
  expect(restaurant.distance).to eq(363.69836433401923)
  end
end