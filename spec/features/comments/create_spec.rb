describe 'Comments' do
  let(:user) { create :user }
  let(:post) { create :post }
  let!(:comment) { create :comment, post: post, user: user }

  before(:each) do
    sign_in user
    visit post_path(post)
  end

  context 'with valid params' do
    it 'creates a new comment' do
      fill_in 'comment_body', with: 'First comment!'
      click_button 'Add Comment'
      expect(page).to have_content 'First comment!'
    end

    it 'deletes existing comment' do
      click_link('delete_comment', href: "/posts/#{post.id}/comments/#{comment.id}")
      expect(page).to have_no_content 'Awesome comment number 1'
    end
  end

  # context 'with invalid params' do
  #   it 'does not create a new comment' do
  #     fill_in 'comment_body', with: 'a'
  #     click_button 'Add Comment'
  #     expect(page).to have_content 'Must be at least 2 characters'
  #   end
  # end
end
