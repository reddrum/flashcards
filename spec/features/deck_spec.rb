require "rails_helper"

describe "Decks", :type => :feature do
  context "create" do
    let!(:user) { create(:user) }
    let!(:card) { create(:card) }
    before(:each) do
      login('qwerty@gmail.com', '123456')
      visit new_deck_path
    end

    it "new deck" do
      fill_in('deck_title', with: 'deck1')
      click_button 'Create Deck'
      expect(page).to have_content 'Title'
    end
  end

  context "all decks page&set as current deck" do
    let!(:user) { create(:user) }
    let!(:deck) { create(:deck, user: user) }
    let!(:card) { create(:card) }
    before(:each) do
      login('qwerty@gmail.com', '123456')
      visit decks_path
      click_link "Set"
    end    

    it { expect(page).to have_content "<<>>" }
  end
end