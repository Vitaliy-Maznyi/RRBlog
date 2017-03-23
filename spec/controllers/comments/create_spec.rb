describe CommentsController do
  describe 'POST #create' do
    let(:user) { create :user }
    let(:new_post) { create :post, user: user }

    before(:each) do
      sign_in user
    end

    def post_query(body = '')
      post :create, post_id: new_post.id, comment: attributes_for(:comment, body: body)
    end

    context 'with valid attributes' do
      it 'creates a new comment' do
        expect{ post_query('new comment') }.to change(Comment, :count).by(1)
      end

      it 'redirects and shows the post with comment' do
        post_query('new comment')
        expect(response).to redirect_to( post_path(assigns(:comment)) )
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new comment' do
        expect{ post_query }.to_not change(Comment, :count)
      end
    end
  end
end