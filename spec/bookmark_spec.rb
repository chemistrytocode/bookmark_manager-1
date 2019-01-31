require 'bookmark'
require_relative './features/web_helpers'

describe Bookmark do
  describe '#all' do
  it 'returns a list of bookmarks' do
    populate_test_db
    bookmarks = Bookmark.all
    expect(bookmarks[0]).to be_a Bookmark
    expect(bookmarks[0].id).to include("1")
    expect(bookmarks[0].url).to include("http://www.makersacademy.com")
    expect(bookmarks[0].title).to include("Makers")
  end
end

  describe '#create' do
    it 'adds a bookmark to the database' do
      Bookmark.create("Wikipedia", "http://www.wikipedia.org")
      bookmarks = Bookmark.all
      expect(bookmarks[0].id).to include("1")
      expect(bookmarks[0].url).to include("http://www.wikipedia.org")
      expect(bookmarks[0].title).to include("Wikipedia")
    end
  end

  describe '#delete' do
    it 'deletes a bookmark from the database' do
      populate_test_db
      Bookmark.delete(1)
      bookmarks = Bookmark.all
      expect(bookmarks[0].id).to_not include("1")
      expect(bookmarks[0].url).to_not include("http://www.makersacademy.com")
      expect(bookmarks[0].title).to_not include("Makers")
    end
  end
end
