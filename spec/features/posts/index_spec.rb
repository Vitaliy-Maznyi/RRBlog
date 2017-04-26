describe 'Posts' do
  let!(:posts) { create_list :post, 5 }

  context 'visit index page' do
    it 'shows all posts' do
      visit posts_path
      posts.each do |post|
        [post.title.to_s, "by #{post.user.first_name}", 'Read more'].each do |content|
          expect(page).to have_content content
        end
      end
    end
  end
end
