describe 'post feature', type: :feature do
  let(:user) { create :user }

  before(:each) do
    sign_in user
  end

  it 'creates a new post' do
    visit new_post_path
    fill_in 'post_title', with: 'New title for post'
    fill_in 'post_text', with: 'Interesting post with lots of words'
    click_button 'Save Post'
    expect(page).to have_content 'New title for post'
    expect(page).to have_content 'Interesting post with lots of words'
  end
end
