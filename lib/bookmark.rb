require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @url = url
    @title = title
  end

  def self.connect
    ENV['RACK_ENV'] == 'test' ? db = 'bookmark_manager_test' : db = 'bookmark_manager'
    @connection = PG.connect(dbname: db )
  end

  def self.all
    connect
    bookmarks = @connection.exec ("SELECT * FROM bookmarks")
    bookmarks.map { |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
      }
  end

  def self.create(title, url)
    connect
    @connection.exec("INSERT INTO bookmarks(title, url) VALUES('#{title}', '#{url}');" )
  end

  def self.delete(id)
    connect
    @connection.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end
end
