# frozen_string_literal: true

require 'pg'

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id:, url:, title:)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end

    result = connection.exec('SELECT * FROM bookmarks;')
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title'])
    end
  end

  def self.create(url:, title:)
    connection = 
      if ENV['ENVIRONMENT'] == 'test'
        PG.connect(dbname: 'bookmark_manager_test')
      else
        PG.connect(dbname: 'bookmark_manager')
      end

    result = connection.exec_params(
      'INSERT INTO bookmarks(url, title) VALUES($1, $2) RETURNING id, title, url;', [url, title]
    )

    Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
  end

  def self.delete(id:)
    connection = 
      if ENV['ENVIRONMENT'] == 'test'
        PG.connect(dbname: 'bookmark_manager_test')
      else
        PG.connect(dbname: 'bookmark_manager')
      end
    connection.exec_params("DELETE FROM bookmarks WHERE id = $1", [id])
  end

  def self.update(id:, url:, title:)
    connection = 
      if ENV['ENVIRONMENT'] == 'test'
        PG.connect(dbname: 'bookmark_manager_test')
      else
        PG.connect(dbname: 'bookmark_manager')
      end
    result = connection.exec_params(
      "UPDATE bookmarks SET url = $1, title = $2 WHERE id = $3 RETURNING id, url, title", [url, title, id])
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.find(id:)
    connection = 
      if ENV['ENVIRONMENT'] == 'test'
        PG.connect(dbname: 'bookmark_manager_test')
      else
        PG.connect(dbname: 'bookmark_manager')
      end
    result = connection.exec_params("SELECT * FROM bookmarks WHERE id = $1;", [id])
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end
end
