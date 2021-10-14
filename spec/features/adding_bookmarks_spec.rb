# frozen_string_literal: true

feature 'Adding bookmarks' do
  scenario 'a user adds 1 bookmark' do
    visit('/')
    fill_in :url, with: 'www.something.com'
    fill_in :title, with: 'Something'
    click_button 'Save'
    visit '/bookmarks'

    expect(page).to have_link('Something', href: 'www.something.com')

  end
end
