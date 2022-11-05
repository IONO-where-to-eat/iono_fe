require 'rails_helper'

RSpec.describe 'Results Page' do
  describe 'as a visitor' do
    let!(:restaurant1) { build(:restaurant) }
    let!(:restaurant2) { build(:restaurant) }
    let!(:restaurant3) { build(:restaurant) }
    let!(:restaurant4) { build(:restaurant) }
    let!(:restaurant5) { build(:restaurant) }
    let!(:restaurant6) { build(:restaurant) }

    before :each do
      allow(RestaurantsFacade).to receive(:restaurants).and_return([restaurant1, restaurant2, restaurant3, restaurant4, restaurant5, restaurant6])
      visit root_path
      click_button 'Where to Eat'
      expect(current_path).to eq(results_path)
    end

    it 'displays three restaurants with descriptions' do
      expect(page).to have_content(restaurant1.name)
      expect(page).to have_content(restaurant2.name)
      expect(page).to have_content(restaurant3.name)
      expect(page).to_not have_content(restaurant4.name)

      within('#restaurant_1') do
        expect(page).to have_content(restaurant1.name)
        expect(page).to have_content(restaurant1.display_phone)
        expect(page).to have_content(restaurant1.distance)
        expect(page).to have_content(restaurant1.rating)
        expect(page).to have_content(restaurant1.review_count)
        expect(page).to have_content(restaurant1.transactions.to_sentence)
      end
    end

    it 'returns restaurants with links to respective yelp show page' do
      expect(page).to have_link(restaurant1.name)
      expect(page).to have_link(restaurant2.name)
      expect(page).to have_link(restaurant3.name)
      expect(page).to_not have_link(restaurant4.name)

      href = "#{restaurant1.url}"
      page.should have_selector "a[href='#{href}']", text: "#{restaurant1.name}"

    end

    it 'has a link to return to landing page' do
      expect(page).to have_link('Home')
      click_on 'Home'
      expect(current_path).to eq(root_path)
    end

    xit 'has button that shuffles restaurant options' do
      expect(page).to have_button('Shuffle')
      click_button 'Shuffle'
    end
  end
end
