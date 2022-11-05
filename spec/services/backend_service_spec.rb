require 'rails_helper'

RSpec.describe 'Backend Service Testing' do
  it 'register_user' do
    user_params = { create(:user) }
    user = BackendService.register_user(user_params)
    
    expect(user).to be_a Hash
    expect(user).to have_key(:google_id)
    expect(user[:google_id]).to be_a String
    expect(user).to have_key(:email)
    expect(user[:email]).to be_a String
    expect(user).to have_key(:token)
    expect(user[:token]).to be_a String
  end

  it 'get_restaurants' do
    restaurants = BackendService.get_restaurants
    expect(restaurants).to be_an Array

    restaurants.each do |restaurant| do
      expect(restaurant).to be_a Restaurant
      expect(restaurant).to have_key (:id)
      expect(restaurant[:id]).to be_a String
      expect(restaurant).to have_key (:name)
      expect(restaurant[:name]).to be_a String
      expect(restaurant).to have_key (:image_url)
      expect(restaurant[:image_url]).to be_a String
      expect(restaurant).to have_key (:is_closed)
      expect(restaurant[:is_closed]).to be_a String
      expect(restaurant).to have_key (:url)
      expect(restaurant[:url]).to be_a String
      expect(restaurant).to have_key (:review_count)
      expect(restaurant[:review_count]).to be_a String
      expect(restaurant).to have_key (:categories)
      expect(restaurant[:categories]).to be_an Array
      expect(restaurant).to have_key (:rating)
      expect(restaurant[:rating]).to be_a String
      expect(restaurant).to have_key (:transactions)
      expect(restaurant[:transactions]).to be_a String
      expect(restaurant).to have_key (:price)
      expect(restaurant[:price]).to be_a String
      expect(restaurant).to have_key (:location)
      expect(restaurant[:location]).to be_a String
      expect(restaurant).to have_key (:display_phone)
      expect(restaurant[:display_phone]).to be_a String
      expect(restaurant).to have_key (:distance)
      expect(restaurant[:distance]).to be_a String
    end
  end
end