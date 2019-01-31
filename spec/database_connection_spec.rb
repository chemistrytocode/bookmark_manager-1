require 'database_connection'

describe DatabaseConnection do

  describe '#Setup' do
    it 'Sets up a connection to the Database' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  describe '#Connection' do
    it 'Returns the setup configuration' do
    connection = DatabaseConnection.setup('bookmark_manager_test')
    expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '#Query' do
    it 'Executes a query via PG' do
    connection = DatabaseConnection.setup('bookmark_manager_test')
    expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
    DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end
