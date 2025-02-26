# frozen_string_literal: true

require "pg"

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id:, url:, title:)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    bookmarks = DatabaseConnection.query('SELECT * FROM bookmarks;', [])
    bookmarks.map do |bookmark|
      Bookmark.new(
        id: bookmark["id"],
        url: bookmark["url"],
        title: bookmark["title"],
      )
    end
  end

  def self.create(url:, title:)
    return false unless is_url?(url)
    result = DatabaseConnection.query(
      "INSERT INTO bookmarks(url, title) VALUES($1, $2) RETURNING id, title, url;", [url, title]
    )
    Bookmark.new(id: result[0]["id"], url: result[0]["url"], title: result[0]["title"])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = $1", [id])
  end

  def self.update(id:, url:, title:)
    result = DatabaseConnection.query(
      "UPDATE bookmarks SET url = $1, title = $2 WHERE id = $3 RETURNING id, url, title", [url, title, id]
    )
    Bookmark.new(id: result[0]["id"], title: result[0]["title"], url: result[0]["url"])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = $1;", [id])
    Bookmark.new(id: result[0]["id"], title: result[0]["title"], url: result[0]["url"])
  end

  def comments(comment_class = Comment)
    comment_class.where(bookmark_id: id)
  end

  def tags
    DatabaseConnection.query(
      "SELECT * FROM tags
      INNER JOIN bookmark_tags on tags.id = bookmark_tags.tag_id
      INNER JOIN bookmarks on bookmarks.id = bookmark_tags.bookmark_id
      WHERE bookmarks.id = $1;", [self.id]
    )

    # "SELECT * FROM bookmark_tags INNER JOIN tags ON tags.id = bookmark_tags.tag_id WHERE bookmark_tags.bookmark_id = $1"
    # bookmark_id, tag_id FROM bookmark_tags
  end

  private

  def self.is_url?(url)
    url =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
  end
end
