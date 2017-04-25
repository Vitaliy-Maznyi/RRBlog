describe 'Post' do
  let(:user) { create :user }
  let(:bad_user) { create :user }
  let(:post) { create :post, user: user }

  context 'with user permission' do
    it 'deletes existing post' do
      sign_in user
      visit post_path(post)
      click_link('Delete', href: "/posts/#{post.id}")
      expect(page).to have_no_content post.title
    end
  end
  context 'without user permission' do
    it 'does not show delete button' do
      sign_in bad_user
      visit post_path(post)
      expect(page).not_to have_selector(:link, 'Delete')
    end
  end
end
