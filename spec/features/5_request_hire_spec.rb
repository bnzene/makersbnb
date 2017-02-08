feature 'FEATURE 5: Request to hire a space' do

  before do
    Space.create(name: 'Brooklyn loft apartment', description: '3 bed apartment', price: '80')
  end
  scenario "User can see a request to hire button" do
    visit '/spaces'
    click_button 'View'
    expect(page).should have_selector("input[type=submit][value='Request to hire']")
    #expect(page).should have_submit_button("Request to hire")

  end

  scenario 'User can be transferred to the "Thank you for your request" page' do
    visit '/spaces'
    click_button 'View'
    click_button "Request to hire"
    expect(page).to have_content("Thank you for your request! The owner will contact you soon.")

  end
end
