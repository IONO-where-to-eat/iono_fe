require 'rails_helper'

RSpec.describe 'Results Page' do
    describe 'as a visitor' do
        before :each do
            visit root_path
            click_button 'Where to Eat'
        end
        it 'displays three restaurants with descriptions' do
            
        end

        it 'returns restaurants with links to respective yelp show page' do

        end

        it 'has button to shuffle restaurant options' do
            
        end

        it 'has a link to return to landing page' do

        end
    end
end