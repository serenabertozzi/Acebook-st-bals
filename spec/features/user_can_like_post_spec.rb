feature 'liking posts' do
  scenario 'user can like a post and see the like' do
    visit "/"
    fill_in "post[message]", with: "Hello, world!"
    click_button "Create Post"
    visit "/"
    click_link "Like"
    visit "/"
    click_link "Show"
    expect(page).to have_content "Likes count: 1"
  end
end