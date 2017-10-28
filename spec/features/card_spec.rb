describe "Cards", :type => :feature do

  it "create new card" do
    visit new_card_path
    fill_in('card_original_text', with: 'river')
    fill_in('card_translated_text', with: 'река')
    click_button 'Create Card'
    expect(page).to have_content 'река'
  end
end