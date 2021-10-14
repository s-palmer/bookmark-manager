# frozen_string_literal: true

feature "Adding bookmarks" do
  scenario "a user adds 1 bookmark" do
    add_test_bookmark
    expect(page).to have_link("Test", href: "http://test.com")
  end

  scenario "The bookmark must be a valid URL" do
    visit "/"
    fill_in("url", with: "not a real bookmark")
    click_button("Save")
    expect(page).to have_content "You must submit a valid URL."
    expect(page).not_to have_content "not a real bookmark"
  end
end
