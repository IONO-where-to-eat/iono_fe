require 'rails_helper'

RSpec.describe 'Backend Service Testing' do
  it 'register_user' do
    user_params = { email: Faker::Omniauth.google[:info][:email], token: Faker::Omniauth.google[:credentials][:token], google_id: Faker::Omniauth.google[:uid] }
    user = BackendService.register_user(user_params)
    
    expect(user).to be_a Hash
    expect(user[:data][:attributes]).to have_key(:google_id)
    expect(user[:data][:attributes][:google_id]).to be_a String
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes][:email]).to be_a String
    expect(user[:data][:attributes]).to have_key(:token)
    expect(user[:data][:attributes][:token]).to be_a String
  end

  it 'get_restaurants' do
    restaurants = BackendService.get_restaurants[:businesses]
    expect(restaurants).to be_an Array

    restaurants.each do |restaurant|
      expect(restaurant).to have_key(:id)
      expect(restaurant[:id]).to be_a String
      expect(restaurant).to have_key(:name)
      expect(restaurant[:name]).to be_a String
      expect(restaurant).to have_key(:image_url)
      expect(restaurant[:image_url]).to be_a String
      expect(restaurant).to have_key(:is_closed)
      expect(restaurant).to have_key(:url)
      expect(restaurant[:url]).to be_a String
      expect(restaurant).to have_key(:review_count)
      expect(restaurant[:review_count]).to be_an Integer
      expect(restaurant).to have_key(:categories)
      expect(restaurant[:categories]).to be_an Array
      expect(restaurant).to have_key(:rating)
      expect(restaurant[:rating]).to be_a Float
      expect(restaurant).to have_key(:transactions)
      expect(restaurant[:transactions]).to be_an Array
      expect(restaurant).to have_key(:location)
      expect(restaurant[:location][:display_address]).to be_an Array
      expect(restaurant).to have_key(:display_phone)
      expect(restaurant[:display_phone]).to be_a String
      expect(restaurant).to have_key (:distance)
      expect(restaurant[:distance]).to be_a Float
    end
  end

    it 'can get_restaurants with a single filter', :vcr do
      filter_params = {:radius=>nil, :open_now=>true, :price=>nil}
      restaurants = BackendService.get_restaurants(filter_params)

      expect(restaurants[:businesses]).to be_an Array

      restaurants[:businesses].each do |restaurant|
        expect(restaurant).to have_key(:is_closed)
        expect(restaurant[:is_closed]).to eq(false)
        expect(restaurant[:is_closed]).to_not eq(true)
      end
    end

    it 'can get_restaurants with multiple filters', :vcr do
      filter_params = {:radius=>1, :open_now=>true, :price=>3}
      restaurants = BackendService.get_restaurants(filter_params)
      expect(restaurants[:businesses]).to be_an Array

      restaurants[:businesses].each do |restaurant|
        expect(restaurant).to have_key(:distance)
        expect(restaurant[:distance]).to be <= 2400
        expect(restaurant).to have_key(:is_closed)
        expect(restaurant[:is_closed]).to be(false)
        expect(restaurant).to have_key(:price)
        expect(restaurant[:price]).to eq('$$$')
      end
  end
end
