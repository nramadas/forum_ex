def sign_in(user)
  visit signin_path
  fill_in "Name", with: user.name
  click_button("Sign In")
end