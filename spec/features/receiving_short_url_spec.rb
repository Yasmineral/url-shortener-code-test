feature 'receive shorterned url' do
  scenario 'user is returned a shortned version of their long URL' do
    visit('/')
    fill_in('url', with: 'http://www.farmdrop.com')
    click_button 'Submit'
    expect(page).to have_content('/abc123')
  end
end