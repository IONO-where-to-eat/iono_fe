require 'rails_helper'

RSpec.describe 'Backend Service Testing' do
  it 'register_user' do
    user_params = ( create(:user) )
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
      expect(restaurant).to have_key(:price)
      expect(restaurant[:price]).to be_a String
      expect(restaurant).to have_key(:location)
      expect(restaurant[:location][:display_address]).to be_an Array
      expect(restaurant).to have_key(:display_phone)
      expect(restaurant[:display_phone]).to be_a String
      expect(restaurant).to have_key (:distance)
      expect(restaurant[:distance]).to be_a Float
    end

    it 'can get_restaurants with a single filter' do
      filter_params = {}
      restaurants = BackendService.get_restaurants(filter_params)

    end

    it 'can get_restaurants with multiple filters' do
      filter_params = {}
      restaurants = BackendService.get_restaurants(filter_params)

    end
  end
end