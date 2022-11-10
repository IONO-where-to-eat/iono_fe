require 'rails_helper'

RSpec.describe 'Results Page' do
  describe 'as a visitor' do
    let!(:restaurant1) { build(:restaurant) }
    let!(:restaurant2) { build(:restaurant) }
    let!(:restaurant3) { build(:restaurant) }
    let!(:restaurant4) { build(:restaurant) }
    let!(:restaurant5) { build(:restaurant) }
    let!(:restaurant6) { build(:restaurant) }
    let!(:restaurant7) { build(:restaurant) }

    before :each do
      allow(RestaurantsFacade).to receive(:restaurants)
        .and_return([restaurant1, restaurant2, restaurant3, restaurant4, restaurant5, restaurant6, restaurant7])
      visit root_path
      click_button 'Where to Eat'
      expect(current_path).to eq(results_path)
    end

    it 'displays one restaurant with description' do
      expect(page).to have_content(restaurant1.name)
      expect(page).to_not have_content(restaurant2.name)
      expect(page).to_not have_content(restaurant3.name)
      expect(page).to_not have_content(restaurant4.name)

      expect(page).to have_content(restaurant1.name)
      expect(page).to have_content(restaurant1.display_phone)
      expect(page).to have_content(restaurant1.distance)
      expect(page).to have_content(restaurant1.rating)
      expect(page).to have_content(restaurant1.review_count)
      expect(page).to have_content(restaurant1.transactions.to_sentence)
    end

    it 'returns restaurants with links to respective yelp show page' do
      expect(page).to have_link(restaurant1.name)
      expect(page).to_not have_link(restaurant2.name)
      expect(page).to_not have_link(restaurant3.name)
      expect(page).to_not have_link(restaurant4.name)

      href = restaurant1.url.to_s
      page.should have_selector "a[href='#{href}']", text: restaurant1.name.to_s
    end

    it 'has a link to return to landing page' do
      expect(page).to have_link('Home')
      click_on 'Home'
      expect(current_path).to eq(root_path)
    end

    it 'has button that shuffles restaurant options' do
      expect(page).to have_content(restaurant1.name)
      expect(page).to have_button('Shuffle')
      click_button 'Shuffle'
      expect(current_path).to eq(results_path)
      expect(page).to have_content(restaurant2.name)
      expect(page).to_not have_content(restaurant4.name)
      expect(page).to_not have_content(restaurant5.name)
      expect(page).to_not have_content(restaurant6.name)
      expect(page).to_not have_content(restaurant1.name)
      expect(page).to_not have_content(restaurant7.name)
      click_button 'Shuffle'
      expect(page).to have_content(restaurant3.name)
      expect(page).to_not have_content(restaurant4.name)
      expect(page).to_not have_content(restaurant2.name)
      expect(page).to_not have_content(restaurant5.name)
      expect(page).to_not have_content(restaurant6.name)
      expect(page).to_not have_content(restaurant1.name)
      expect(page).to_not have_content(restaurant7.name)
    end

    describe 'sad path for visitor' do
      it 'sad path for no restaurants returned' do
        allow(RestaurantsFacade).to receive(:restaurants).and_return([])
        visit root_path
        click_button 'Where to Eat'
        expect(page).to have_content('No restaurants found. Please login to refine your search.')
        expect(current_path).to eq(root_path)
      end
    end
  end

  describe 'as a User' do
    let!(:restaurant1) { build(:restaurant) }
    let!(:restaurant2) { build(:restaurant) }
    let!(:restaurant3) { build(:restaurant) }
    let!(:restaurant4) { build(:restaurant) }
    let!(:restaurant5) { build(:restaurant) }
    let!(:restaurant6) { build(:restaurant) }
    let!(:restaurant7) { build(:restaurant) }

    before :each do
      visit root_path

      OmniAuth.config.test_mode = true
      OmniAuth.config.silence_get_warning = true
      OmniAuth.config.mock_auth[:google_oauth2] =
        OmniAuth::AuthHash.new(
          {
            provider: 'google',
            uid: '123545',
            info: {
              email: 'email@gmail.com',
              first_name: 'Smudger'
            },
            credentials: {
              token: '222'
            }
          }
        )
      click_on 'Login with Google'
    end

    it 'directs from /search' do
      allow(RestaurantsFacade).to receive(:restaurants)
        .and_return([restaurant1, restaurant2, restaurant3, restaurant4, restaurant5, restaurant6, restaurant7])
      click_on 'Find Me Food'
      expect(current_path).to eq(results_path)
    end

    it 'logs out a user' do
      allow(RestaurantsFacade).to receive(:restaurants)
        .and_return([restaurant1, restaurant2, restaurant3, restaurant4, restaurant5, restaurant6, restaurant7])
      click_on 'Find Me Food'
      expect(page).to have_link('Logout')
      expect(page).to_not have_link('Home')
      click_on 'Logout'
      expect(current_path).to eq(root_path)
    end

    it 'sad paths back to user filters if no restaurants are returned' do
      allow(RestaurantsFacade).to receive(:restaurants).and_return([])

      click_on 'Find Me Food'

      expect(page).to have_content('No restaurants match your filters. Please refine your search.')
      expect(current_path).to eq(dashboard_path('123545'))
    end
  end
end
