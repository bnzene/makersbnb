def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in 'email',   with: 'rob@example.com'
  fill_in 'password', with: 'qwerty'
  fill_in 'password_confirmation', with: 'qwerty'
  click_button "Sign Up"
end

def sign_in
  fill_in 'email',   with: 'rob@example.com'
  fill_in 'password', with: 'qwerty'
  click_button "Sign In"
end
