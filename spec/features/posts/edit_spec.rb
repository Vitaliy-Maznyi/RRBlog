describe 'Posts' do
  let(:user) { create :user }
  let!(:post) { create :post, user: user }

  before(:each) do
    sign_in user
  end
  after(:each) do
    click_link('Edit', href: "/posts/#{post.id}/edit")
    expect(page).to have_content 'Editing post'
  end

  context 'from index posts page' do
    it 'visits edit page' do
      visit root_path
    end
  end
  context 'from show post page' do
    it 'visits edit page' do
      visit post_path(post)
    end
  end
end
