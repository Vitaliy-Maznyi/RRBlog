describe PostsController do
  let(:user) { create :user }
  let(:post) { create :post, user: user }

  context 'GET #new' do
    before(:each) do |example|
      sign_in user unless example.metadata[:skip_before]
      get :new
    end

    it 'redirects to sign in form if unauthorized', :skip_before do
      expect(response).to redirect_to(new_user_session_path)
    end
    it 'assigns a new post to @post' do
      expect(assigns(:post)).to be_a_new(Post)
    end
    it 'renders the :new template' do
      expect(response).to render_template :new
    end
  end
end
