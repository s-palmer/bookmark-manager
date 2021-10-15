class Tag
  attr_reader :id, :content

  def initialize(id:, content:)
    @id = id
    @content = content
  end

  def self.create(content:, bookmark_id:)
    result = DatabaseConnection.query(
      "INSERT INTO tags (content) VALUES ($1) RETURNING id, content;",
      [content]
    )
    DatabaseConnection.query(
      "INSERT INTO bookmark_tags (bookmark_id, tag_id) VALUES ($1, $2);",
      [bookmark_id, result[0]['id']]
    )
    Tag.new(
        id: result[0]['id'],
        content: result[0]['content']
      )
  end
end