feature 'deleting posts' do
  scenario 'a user can delete their post' do

    register_and_sign_in
    create_test_post
    click_link "Delete"

    expect(page).not_to have_content "Hello, world!"
    expect(page).to have_content "Post was successfully destroyed."
  end
end