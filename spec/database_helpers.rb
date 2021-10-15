# frozen_string_literal: true
require_relative '../lib/database_connection'

require 'pg'

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'bookmark_manager_test')
  DatabaseConnection.query(
    "SELECT * FROM #{table} WHERE id = '#{id}';"
  )
end
