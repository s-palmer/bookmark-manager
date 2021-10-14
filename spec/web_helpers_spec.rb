# frozen_string_literal: true

def add_test_data
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks(url, title) VALUES('http://www.makersacademy.com', 'Makers');")
  connection.exec("INSERT INTO bookmarks(url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy');")
  connection.exec("INSERT INTO bookmarks(url, title) VALUES('http://www.google.com', 'Google');")
end

def go_to_bookmarks
  visit('/')
  click_button('View All Bookmarks')
end

def add_test_bookmark
  visit('/')
  fill_in('title', with: 'Test')
  fill_in('url', with: 'http://test.com')
  click_button('Save')
end
