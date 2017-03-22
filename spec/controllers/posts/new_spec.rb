describe PostsController do
  let(:user) { create :user}
  let(:post) { create :post, user: user }

  context 'GET #new' do

    before(:each) do
      sign_in user
      get :new
    end

    it 'assigns a new post to @post' do
      expect(assigns(:post)).to be_a_new(Post)
    end
    it 'renders the :new template' do
      expect(response).to render_template :new
    end

  end
end