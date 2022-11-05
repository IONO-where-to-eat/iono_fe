require 'rails_helper'

RSpec.describe 'Results Page' do
  describe 'as a visitor', :vcr do
    before :each do
      visit root_path
      click_button 'Where to Eat'
      expect(current_path).to eq(results_path)
    end

    it 'displays three restaurants with descriptions' do
      expect(page).to have_content('Snooze, an A.M. Eatery')
      expect(page).to have_content("Steuben's Uptown")
      expect(page).to have_content("City O' City")
      expect(page).to_not have_content('Guard and Grace')

      within('#restaurant_1') do
        expect(page).to have_content('Snooze, an A.M. Eatery')
        # expect(page).to have_content('https://s3-media4.fl.yelpcdn.com/bphoto/cniSi66T4iS6nqCdML6HUQ/o.jpg')
        expect(page).to have_content('Open Now')
        expect(page).to have_content('Rating: 4.5 out of 5')
        expect(page).to have_content('Number of Reviews: 4794')
        expect(page).to have_content('Categories: Breakfast & Brunch, Cocktail Bars, and American (Traditional)')
        expect(page).to have_content('Offers delivery')
        expect(page).to have_content('Address: 2262 Larimer St Denver, CO 80205')
        expect(page).to have_content('Phone: (303) 297-0700')
        expect(page).to have_content('Distance: 1.14 miles')
      end
    end

    it 'returns restaurants with links to respective yelp show page' do
      expect(page).to have_link('Snooze, an A.M Eatery')
      expect(page).to_not have_link('Guard and Grace')

      click_on 'Snooze, an A.M Eatery'

      expect(current_path).to eq('https://www.yelp.com/biz/snooze-an-a-m-eatery-denver-12?adjust_creative=HXaFGsDa_NpgBlPglTMuTA\u0026utm_campaign=yelp_api_v3\u0026utm_medium=api_v3_business_search\u0026utm_source=HXaFGsDa_NpgBlPglTMuTA')
    end

    it 'has a link to return to landing page' do
      expect(page).to have_link('Home')
      click_on 'Home'
      expect(current_path).to eq(root_path)
    end

    xit 'has button that shuffles restaurant options' do
      # create_list(:restaurant, 6)
      expect(page).to have_button('Shuffle')
      click_button 'Shuffle'
    end

  end 
end