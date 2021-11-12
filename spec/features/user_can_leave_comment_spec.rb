require 'rails_helper'

RSpec.feature 'leaving a comment' do
  scenario 'user can leave comment under post and see it' do
    register_and_sign_in
    create_test_post
    click_link('Add Comment')
    fill_in "comment[comment_text]", with: "test comment"
    click_button "Create Comment"
    
    expect(page).to have_content("test comment")
  end
end
