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

    it 'returns a list of bookmarks' do

      bookmark = Bookmark.create('http://www.makersacademy.com', 'Makers')
      Bookmark.create('http://www.destroyallsoftware.com', 'Destroy')
      Bookmark.create('http://www.google.com', 'Google')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
  end

end
