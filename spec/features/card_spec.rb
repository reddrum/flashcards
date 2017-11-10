require "rails_helper"
require "helpers/login_helper"

describe "Cards", :type => :feature do

  context "create" do
    let!(:user) { create(:user) }
    let!(:deck) { create(:deck) }
    let!(:card) { create(:card) }
    before(:each) { login('qwerty@gmail.com', '123456') }

    it "create new card&upload image" do
      visit new_card_path
      attach_file 'card[image]', "#{Rails.root}/spec/fixtures/picture.jpg"
      fill_in('card_original_text', with: 'river')
      fill_in('card_translated_text', with: 'река')
      click_button 'Create Card'
      expect(page).to have_css("img[src*='picture.jpg']")
    end

    it "create new card&upload image from URL" do
      visit new_card_path
      fill_in('card_image_remote_url', with: 'https://cdn.igromania.ru/mnt/news/6/8/e/1/c/3/67083/2ea4ae5defac8588_1200xH.jpg')
      fill_in('card_original_text', with: 'river')
      fill_in('card_translated_text', with: 'река')
      click_button 'Create Card'
      expect(page).to have_xpath("//img[contains(@src,'2ea4ae5defac8588_1200xH.jpg')]")
    end
  end

  context "checks" do
    let!(:user) { create(:user) }
    let!(:deck) { create(:deck, user: user) }
    let!(:card) { create(:card, deck: deck) }
    before(:each) do
      login('qwerty@gmail.com', '123456')
      user.update_attribute(:current_deck_id, deck.id)
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