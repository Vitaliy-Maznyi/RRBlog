describe PostsController do
  context 'DELETE #destroy' do
    let(:user) { create :user }
    let!(:post) { create :post, user: user }

    before(:each) do
      sign_in user
    end

    it 'deletes the post' do
      expect do
        delete :destroy, id: post.id
      end.to change(Post, :count).by(-1)
    end

    it 'redirects to posts#index' do
      delete :destroy, id: post.id
      expect(response).to redirect_to action: :index
    end
  end
end
