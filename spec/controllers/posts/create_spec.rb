describe PostsController do
  describe 'POST #create' do
    let(:user) { create :user }

    before(:each) do
      sign_in user
    end

    def post_query(title = '')
      post :create, post: attributes_for(:post, title: title)
    end

    context 'with valid attributes' do
      it 'creates a new post' do
        expect { post_query('new title') }.to change(Post, :count).by(1)
      end

      it 'redirects and shows the post' do
        post_query('new title')
        expect(response).to redirect_to(post_path(assigns(:post)))
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new post' do
        expect { post_query }.to_not change(Post, :count)
      end

      it 're-renders the new template' do
        post_query
        expect(response).to render_template :new
      end
    end
  end
end
