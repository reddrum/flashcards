require "rails_helper"

describe "Registration", :type => :feature do
  it "create new user" do
    visit signup_path
    fill_in :user_email, with: "mail@mail.net"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "password"
    click_button 'Create User'
    expect(page).to have_content "Signed up!"
  end
end