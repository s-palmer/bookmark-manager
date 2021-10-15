feature 'adding and viewing tags' do
  feature 'a user can add and then view a tag' do
    scenario 'a tag is added to a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')

      visit '/bookmarks'
      first('.bookmark').click_button 'Add Tag'

      expect(current_path).to eq "/bookmarks/#{bookmark.id}/tags/new"

      fill_in('tag', with: 'Tag - Sports')
      click_button 'Save'

      expect(current_path).to eq '/bookmarks'
      expect(first('.bookmark')).to have_content 'Tag - Sports'
    end
  end
end
