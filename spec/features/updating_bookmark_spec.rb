
feature "Updating bookmarks" do
  scenario "Users can update a bookmark" do
    bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
    visit '/bookmarks'
    expect(page).to have_link("Makers", href: "http://www.makersacademy.com")

    first(".bookmark").click_button "Edit"
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"
    fill_in("url", with: "https://facebook.com")
    fill_in("title", with: "Facebook")
    click_button("Save")

    expect(current_path).to eq "/bookmarks"
    expect(page).not_to have_link("Makers", href: "http://www.makersacademy.com")
    expect(page).to have_link("Facebook", href: "https://facebook.com")
  end
end
