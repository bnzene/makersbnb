feature 'User log in.' do

  # let!(:user) do
  #  User.create(email: 'rob@example.com',
  #              password: 'qwerty',
  #              password_confirmation: 'qwerty')
  # end

  scenario 'I can log in to my account' do
    visit '/'
    click_button 'Sign In'
    expect(page).to have_content ("Log in to Makersbnb")
    login
    expect(page).to have_content('Welcome, rob@example.com')
  end
end
