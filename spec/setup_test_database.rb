require 'pg'
require './lib/database_connection'

def setup_test_database
  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup('bookmark_manager_test')
  else
    DatabaseConnection.setup('bookmark_manager')
  end

def truncate_database
  DatabaseConnection.query('TRUNCATE bookmarks RESTART IDENTITY;')
  end
end
