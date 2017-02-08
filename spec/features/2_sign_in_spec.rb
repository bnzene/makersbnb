feature 'User Sign In.' do

  let!(:user) do
   User.create(email: 'rob@example.com',
               password: 'qwerty',
               password_confirmation: 'qwerty')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
  expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

 #  it 'authenticates when given a valid email address and password' do
 #   authenticated_user = User.authenticate(user.email, user.password)
 #   expect(authenticated_user).to eq user
 # end



end
