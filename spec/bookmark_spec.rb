require "bookmark"
require "database_helpers"

describe Bookmark do
  describe ".all" do
    it 'returns a list of bookmarks' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy')
      Bookmark.create(url: 'http://www.google.com', title: 'Google')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end
  
  describe ".create" do
    it "creates a new bookmark" do
      bookmark = Bookmark.create(url: 'www.test.com', title: 'Test')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test'
      expect(bookmark.url).to eq 'www.test.com'
    end
  end
end

