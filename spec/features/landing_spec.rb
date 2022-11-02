require 'rails_helper'

RSpec.describe 'Landing Page' do
  describe 'As a visitor' do
    describe 'When I visit the landing page (root_path)' do
      before :each do
        visit root_path
      end

      it 'I see IONO header' do
        expect(page).to have_content('IONO')
      end

      it 'I see a button "Where to Eat"' do
        expect(page).to have_button('Where to Eat')
      end

      it 'I see text that says "Much like your palate, would you like to refine your search?"' do
        expect(page).to have_content('Much like your palate, would you like to refine your search?')
      end

      it 'I see a button to login with Google' do
        expect(page).to have_button('Login with Google')
      end
    end
  end
end