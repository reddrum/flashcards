def login(email, password)
  visit login_path
  fill_in :user_email, with: email
  fill_in :user_password, with: password
  click_button 'Login'
end