describe PostsController do
  context 'GET #show' do
    let(:user) {create :user}
    let(:post) { create_list :post, 4, user: user }

    before(:each) do
      get :show, id: post[2].id
    end

    it 'fills post' do
      expect(assigns(:post)).to eq(post[2])
    end

    it 'renders the :show view' do
      expect(response).to render_template :show
    end

  end
end