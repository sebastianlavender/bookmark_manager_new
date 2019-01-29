describe Bookmark do
  it "Should show all bookmarks inside a database" do
    connection = PG.connect(dbname: 'bookmark_manager_test')
      # Add the test data
      connection.exec("INSERT INTO bookmarks (url) VALUES ('www.google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('www.yahoo.com');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include('www.google.com')
      expect(bookmarks).to include('www.yahoo.com')
  end
end