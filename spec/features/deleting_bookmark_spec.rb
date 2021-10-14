require_relative "../web_helpers_spec"

feature "Deleting a bookmark" do
  scenario "User can delete a bookmark" do
    add_test_bookmark
    expect(page).to have_link("Test", href: "http://test.com")

    first(".bookmark").click_button "Delete"
    expect(current_path).to eq "/bookmarks"
    expect(page).not_to have_link("Test", href: "http://test.com")
  end
end
