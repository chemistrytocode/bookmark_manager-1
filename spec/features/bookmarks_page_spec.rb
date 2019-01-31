require_relative './web_helpers'

feature 'shows list of bookmarks' do
  scenario 'user visits bookmarks list view' do
    populate_test_db
    visit '/bookmarks'
    expect(page).to have_link('Destroy', href: 'http://www.destroyallsoftware.com')
  end

  scenario 'adds new bookmark to database' do
    populate_test_db
    visit '/bookmarks'
    click_on 'Add bookmark'
    fill_in 'title', with:"Test"
    fill_in 'url', with:"http://www.test.com"
    click_on 'Save'
    expect(page). to have_content "Test"
  end
end

feature 'delete bookmarks' do
  scenario 'book can be deleted from database' do
    Bookmark.create("Twitter", "http://www.twitter.com")
    Bookmark.create("Two", "http://www.two.com")
    visit '/bookmarks'
    first('.bookmark').click_on 'Delete'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Twitter', href: 'http://www.twitter.com')
  end

feature 'update bookmarks' do
  scenario 'bookmark can be updated' do
    populate_test_db
    visit '/bookmarks'
    first('.bookmark').click_on 'Edit'

    fill_in 'url', with:"http://www.edited.com"
    fill_in 'title', with:"Updated"
    click_on('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Updated', href: 'http://www.edited.com')
  end

end

end
