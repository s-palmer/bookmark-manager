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

  scenario 'The bookmark must be a valid URL' do
    visit '/'
    fill_in('url', with: 'not a real bookmark')
    click_button('Save')
    expect(page).to have_content "You must submit a valid URL."
    expect(page).not_to have_content "not a real bookmark"
  end
end
