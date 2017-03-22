describe PostsController do
  let(:user) { create :user }
  let(:post) { create :post, user: user }

  context 'GET #edit' do

    before(:each) do|example|
      unless example.metadata[:skip_before]
        sign_in user
      end
      get :edit, id: post.id
    end

    it 'redirects to sign in form if unauthorized', :skip_before do
      expect(response).to redirect_to( new_user_session_path )
    end

    it 'assigns a new post to @post' do
      expect(assigns(:post)).to eq(post)
    end

    it 'renders the edit template' do
      expect(response).to render_template :edit
    end

  end
end