# frozen_string_literal: true

feature "Viewing bookmarks" do
  scenario "A user can see a list of their bookmark titles" do
    add_test_bookmark
    expect(page).to have_link("Test", href: "http://test.com")
  end
end
