describe PostsController do
  context 'GET #index' do
    let(:user) { create :user }
    let(:posts_list) { create_list(:post, 5, user: user) }

    before(:each) do
      get :index
    end

    it 'fills an array of posts' do
      expect(assigns(:posts)).to match_array(posts_list)
    end

    it 'renders the :index view' do
      expect(response).to render_template :index
    end

    it 'shows posts with searched query' do
    end
  end
end
