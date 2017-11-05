require "rails_helper"
require "helpers/login_helper"

describe "Cards", :type => :feature do

  context "create" do
    let!(:user) { create(:user) }
    let!(:card) { create(:card) }
    before(:each) { login('qwerty@gmail.com', '123456') }

    it "create new card" do
      visit new_card_path
      fill_in('card_original_text', with: 'river')
      fill_in('card_translated_text', with: 'река')
      click_button 'Create Card'
      expect(page).to have_content 'река'
    end
  end

  context "checks" do
    let!(:user) { create(:user) }
    let!(:card) { create(:card) }
    before(:each) do
      login('qwerty@gmail.com', '123456')
      card.update_attribute(:review_date, Date.current)
      visit root_path
    end

    it "correct answer" do
      fill_in('check_original', with: 'home')
      click_button 'Save Check'
      expect(page).to have_content 'Check'
    end

    it "incorrect answer" do
      fill_in('check_original', with: 'hello')
      click_button 'Save Check'
      expect(page).to have_content 'Wrong'
    end
  end
end