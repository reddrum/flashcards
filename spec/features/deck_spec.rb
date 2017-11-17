require "rails_helper"

describe "Decks", :type => :feature do
  context "create" do
    let!(:user) { create(:user) }
    before(:each) do
      login('qwerty@gmail.com', '123456')
      visit new_deck_path
    end

    it "new deck&current" do
      fill_in('deck_title', with: 'deck1')
      find(:xpath, "(//input[@type='checkbox'])").set(true)
      click_button 'Create Deck'
      expect(page).to have_content 'Title'

      visit decks_path
      it { expect(page).to have_content "<<>>" }
    end
  end
end