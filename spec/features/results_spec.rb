require 'rails_helper'

RSpec.describe 'Results Page' do
    describe 'as a visitor' do
        before :each do
            visit root_path
            click_button 'Where to Eat'
            expect(current_path).to eq(results_path)
        end
        it 'displays three restaurants with descriptions' do

        end

        it 'returns restaurants with links to respective yelp show page' do

        end

        it 'has button that shuffles restaurant options' do
            # create_list(:restaurant, 6)
            save_and_open_page
            expect(page).to have_button("Shuffle")
            click_button "Shuffle"

        end

        it 'has a link to return to landing page' do

        end
    end
end