describe PostsController do
  let(:user) {create :user}
  let(:post) {create :post, user: user}
  let(:valid_attr) do
    { title: 'new_valid_title', text: 'valid text' }
  end
  let(:invalid_attr) do
    {title: '', text: 'valid text'}
  end

  def put_update(attr)
    put :update, id: post.id, post: attr
    post.reload
  end

  before(:each) do
    sign_in user
  end

  context 'with invalid attributes' do
    it 're-renders the edit template' do
      put_update(invalid_attr)
      expect(response).to render_template :edit
    end

    it 'does not change values' do
      put_update(invalid_attr)
      expect(post.title).not_to eq(invalid_attr[:title])
    end
  end

  context 'with valid attributes' do
    it 'redirects to index action' do
      put_update(valid_attr)
      expect(response).to redirect_to( post_path(assigns(:post)) )
    end

    it 'updates values' do
      put_update(valid_attr)
      expect(post.title).to eq(valid_attr[:title])
    end
  end
end