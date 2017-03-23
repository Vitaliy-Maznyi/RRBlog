describe CommentsController do
  context 'DELETE #destroy' do
    let(:user) { create :user }
    let(:new_post) { create :post, user: user }
    let!(:comment) { create :comment, post: new_post}

    before(:each) do
      sign_in user
    end

    it 'deletes the post' do
      expect{
        delete :destroy, post_id: new_post.id, id: comment.id
      }.to change(Comment,:count).by(-1)
    end

    it 'redirects to posts#index' do
      delete :destroy, post_id: new_post.id, id: comment.id
      expect(response).to redirect_to controller: :posts, action: :show, id: new_post.id
    end

  end
end