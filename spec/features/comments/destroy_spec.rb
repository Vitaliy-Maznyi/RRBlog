describe 'Comments' do
  let(:user) { create :user }
  let(:post) { create :post }
  let!(:comment) { create :comment, post: post, user: user }

  before(:each) do
    sign_in user
    visit post_path(post)
  end

  context 'with valid params' do
    it 'deletes existing comment' do
      click_link('delete_comment', href: "/posts/#{post.id}/comments/#{comment.id}")
      expect(page).to have_no_content 'Awesome comment number 1'
    end
  end
end
