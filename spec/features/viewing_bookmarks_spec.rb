# frozen_string_literal: true
require_relative '../web_helpers_spec'

feature 'Viewing bookmarks' do
  scenario 'A user can see a list of their bookmark titles' do
    add_test_data
    visit('/bookmarks')

    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy', href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')

  end
end
