feature 'User sign up.' do
  scenario 'I can sign up as a new user' do

    def sign_up
      visit '/'
      expect(page.status_code).to eq(200)
      fill_in 'email',   with: 'rob@example.com'
      fill_in 'password', with: 'qwerty'
      fill_in 'password_confirmation', with: 'qwerty'
      click_button "Sign Up"
    end

    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, rob@example.com')
    expect(User.first.email).to eq('rob@example.com')
  end
end
