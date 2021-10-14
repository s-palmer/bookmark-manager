feature 'Deleting a bookmark' do
  scenario 'User can delete a bookmark' do
    Bookmark.create(title: 'Facebook', url: 'https://fb.com')
    visit '/bookmarks'
    expect(page).to have_link('Facebook', href: 'https://fb.com')

    first('.bookmark').click_button 'Delete'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Facebook', href: 'https://fb.com')
  end
end

# Visit the bookmarks page.
# Click a 'delete' button next to a bookmark.
# See the bookmarks page, without that bookmark.