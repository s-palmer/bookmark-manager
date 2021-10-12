feature 'Adding bookmarks' do
  scenario 'a user adds 1 bookmark' do
    visit('/')
    fill_in :url, with: 'www.something.com'

    click_button 'submit_url'

    expect(page).to have_content("www.something.com")
  end
end
