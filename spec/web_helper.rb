def sign_up
  visit '/'
  expect(page.status_code).to eq(200)
  fill_in 'email',   with: 'rob@example.com'
  fill_in 'password', with: 'qwerty'
  fill_in 'password_confirmation', with: 'qwerty'
  click_button "Sign Up"
end

def login
  fill_in 'email',   with: 'rob@example.com'
  fill_in 'password', with: 'qwerty'
  click_button "Log In"
end
