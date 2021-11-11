feature 'liking posts' do
  scenario 'user can like a post and see the like' do
    register_and_sign_in
    create_test_post
    visit "/"
    click_link "Like"
    expect(page).to have_content "Likes count: 1"
  end

  scenario 'user can unlike a post' do
    register_and_sign_in
    create_test_post
    visit "/"
    click_link "Like"
    visit "/"
    click_link "Unlike"
    expect(page).to have_content "Likes count: 0"
  end
end

