# 6)
# As a signed-up user
# So I can offer my space
# I need to be able to list a new space with name, description and price/night.

feature "FEATURE 6: View space detail" do

  scenario '1) List a new space' do
    visit '/newspace'
    fill_in :name, with: 'Brooklyn loft apartment'
    fill_in :description, with: '3 bed apartment'
    fill_in :price, with: '80'
    click_button 'List your space!'
    expect(page.status_code).to eq 200
    expect(current_path).to eq '/listingconfirmed'
    expect(page).to have_content('You have listed: Brooklyn loft apartment, 3 bed apartment, £80 per night')
    space = Space.first
    expect(space.name.map(&:name)).to include('Brooklyn loft apartment')
  end
end
