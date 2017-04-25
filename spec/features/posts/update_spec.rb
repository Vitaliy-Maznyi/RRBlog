describe 'Post' do
  let(:user) { create :user }
  let!(:post) { create :post, user: user }

  it 'updates an existing post' do
    sign_in user
    visit edit_post_path(post)
    fill_in 'post_title', with: 'New title for post edited'
    fill_in 'post_text', with: 'Interesting post with lots of words was updated'
    click_button 'Save Post'
    expect(page).to have_content 'New title for post edited'
    expect(page).to have_content 'Interesting post with lots of words was updated'
  end
end
