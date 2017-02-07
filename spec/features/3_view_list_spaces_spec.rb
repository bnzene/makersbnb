# 3)
# As a signed-up user
# I want to view a list of spaces

feature "FEATURE 3: View list of spaces" do

  scenario '1) See existing spaces on the spaces page' do

    Space.create(name: 'Brooklyn loft apartment', description: '3 bed apartment', price: '80')

    visit '/spaces'

    # this is a *temporary* sanity check - to make sure we
    # can load the page :)
    expect(page.status_code).to eq 200

    within 'ul#spaces' do
      expect(page).to have_content('Brooklyn loft apartment')
    end
  end
end
