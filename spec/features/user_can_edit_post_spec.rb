feature 'editting posts' do
  scenario 'User can edit their post' do
    register_and_sign_in
    create_test_post
    click_link "Edit"
    fill_in "post[message]", with: "Updated post"
    click_button "Update Post"

    expect(page).not_to have_content "Hello, world!"
    expect(page).to have_content "Updated post"
  end

  scenario "User gets an error if invalid edit" do
    register_and_sign_in
    create_test_post
    click_link "Edit"
    fill_in "post[message]", with: ""
    click_button "Update Post"

    expect(page).to have_content "Please enter a valid message."
  end
end