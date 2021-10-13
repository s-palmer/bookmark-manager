require 'pg'

class Bookmark

  attr_reader :id, :url, :title
  
  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end 

    result = connection.exec("SELECT * FROM bookmarks;")     
    result.map { |bookmark| 
      Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title'])
    }
  end

  def self.create(url, title)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("INSERT INTO bookmarks(url, title) VALUES('#{url}', '#{title}');")
  end
end
