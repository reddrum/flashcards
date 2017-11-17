require "rails_helper"
require "helpers/login_helper"

describe "Login and logout", :type => :feature do
  let!(:user) { create(:user) }

  context "login failed" do
    before { login('qwerty@gmail.com', '123') }
    it { expect(page).not_to have_content "Login successful" }
  end

  context "login successful" do
    before { login('qwerty@gmail.com', '123456') }
    it { expect(page).to have_content "Login successful" }
  end

  context "logout successful" do
    before do 
      login('qwerty@gmail.com', '123456') 
      click_link "Logout"
    end
    it { expect(page).to have_content "Please login first" }
  end

  context "user not logged in and doesn't see links" do
    before { visit decks_path }
    it { expect(page).not_to have_content "Edit Profile" }
  end
end
