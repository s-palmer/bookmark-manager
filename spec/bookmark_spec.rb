require "bookmark"

describe Bookmark do
  describe "#all" do
    it "returns all bookmarks" do
      expect(Bookmark.all).to eq(["http://www.makersacademy.com/", 
        "http://www.google.com/", "http://www.destroyallsoftware.com"])
    end
  end
end
