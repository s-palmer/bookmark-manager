feature 'Updating bookmarks' do
  scenario 'Users can update a bookmark' do
    Bookmark.create(title: 'Facebook', url: 'https://fb.com')
    visit '/bookmarks'
    expect(page).to have_link('Facebook', href: 'https://fb.com')
    
    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('url', with: "https://facebook.com")
    fill_in('title', with: "Facebook Full URL")
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Facebook', href: 'https://fb.com')
    expect(page).to have_link('Facebook Full URL', href: 'https://facebook.com')
  end
end
