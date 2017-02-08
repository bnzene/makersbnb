
# 4)
# As a signed-up user
# I want to view a space in more detail

feature "FEATURE 4: View space detail" do

  scenario '1) See the name, description and price per night of a particular space' do

    Space.create(name: 'Brooklyn loft apartment', description: '3 bed apartment', price: '80')
    visit '/spaces'
    click_link("View")
    expect(page.status_code).to eq 200
    expect(page).to have_content('Brooklyn loft apartment, 3 bed apartment, £80 per night')
  end
end
