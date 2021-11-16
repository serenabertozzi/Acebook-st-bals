feature 'liking posts' do
  scenario 'user can like a post and see the like' do
    register_and_sign_in
    create_test_post
    click_link "Like"

    expect(page).to have_content "Likes: 1"
  end

  scenario 'user can unlike a post' do
    register_and_sign_in
    create_test_post
    click_link "Like"
    click_link "Unlike"
    
    expect(page).to have_content "Likes: 0"
  end
end

