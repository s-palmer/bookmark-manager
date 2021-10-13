require "bookmark"

describe Bookmark do
  describe ".all" do
    it "returns a list of bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks(url, title) VALUES('http://www.makersacademy.com', 'Makers');")
      connection.exec("INSERT INTO bookmarks(url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy');")
      connection.exec("INSERT INTO bookmarks(url, title) VALUES('http://www.google.com', 'Google');")
      
      bookmarks = Bookmark.all

      expect(bookmarks).to include('Makers')
      expect(bookmarks).to include('Destroy')
      expect(bookmarks).to include('Google')
    end
  end
end

