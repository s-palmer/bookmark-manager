require 'tag'
require 'bookmark'
require_relative '../database_helpers'

describe Tag do
  describe '#create' do
    it "creates a new tag" do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
      tag = Tag.create(content: "This is a test tag", bookmark_id: bookmark.id)

      persisted_data = persisted_data(table: "tags", id: tag.id)

      expect(tag).to be_a Tag
      expect(tag.id).to eq persisted_data.first["id"]
      expect(tag.content).to eq "This is a test tag"
    end
  end
end
