# frozen_string_literal: true

feature 'Adding bookmarks' do
  scenario 'a user adds 1 bookmark' do
    visit('/')
    fill_in :url, with: 'www.something.com'
    fill_in :title, with: 'Something'

    click_button 'submit_url'

    expect(page).to have_content('Something')
  end
end
