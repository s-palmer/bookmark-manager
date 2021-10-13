feature 'Viewing bookmarks' do
  scenario 'A user can see a list of their bookmark titles' do 
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks(url, title) VALUES('http://www.makersacademy.com', 'Makers');")
    connection.exec("INSERT INTO bookmarks(url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy');")
    connection.exec("INSERT INTO bookmarks(url, title) VALUES('http://www.google.com', 'Google');")

    visit('/bookmarks')

    # expect(page).to have_content "Makers"
    # expect(page).to have_content "Destroy"
    # expect(page).to have_content "Google"

    expect(page).to have_link("Makers", :href => "http:www.makersacademy.com")
    expect(page).to have_link("Destroy", :href => "http:www.destroyallsoftware.com")
    expect(page).to have_link("Google", :href => "http:www.google.com")

  # scenario 'can click on the title to see the url' do
    
  # end
  end
end