describe PostsController do
  let(:user) { create :user }
  let(:post) { create :post, user: user }

  context 'GET #edit' do

    before(:each) do
      sign_in user
      get :edit, id: post.id
    end

    it 'assigns a new post to @post' do
      expect(assigns(:post)).to eq(post)
    end

    it 'renders the edit template' do
      expect(response).to render_template :edit
    end

  end
end