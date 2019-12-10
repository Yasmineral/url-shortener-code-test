feature 'submit long url to be shortned' do
  scenario 'long url appears on the page as a reference after submission' do
    visit('/')
    fill_in('url', with: 'http://www.farmdrop.com')
    click_button 'Submit'
    expect(page).to have_content('http://www.farmdrop.com')
  end
end