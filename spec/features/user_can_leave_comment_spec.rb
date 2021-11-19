require 'rails_helper'

RSpec.feature 'leaving a comment' do
  scenario 'user can leave comment under post and see it' do
    only_register
    create_test_post
    fill_in "comment[comment_text]", with: "test comment"
    click_button "Post Comment"
    
    expect(page).to have_content("test comment")
  end
end
