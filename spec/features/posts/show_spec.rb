describe 'Posts' do
  let!(:post) { create :post }

  context 'from index posts page' do
    it 'visits show page' do
      visit root_path
      click_link('Read more', href: "/posts/#{post.id}")
      [post.title.to_s, post.user.first_name.to_s, 'Comments'].each do |content|
        expect(page).to have_content content
      end
    end
  end
end
