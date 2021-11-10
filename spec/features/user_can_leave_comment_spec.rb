require 'rails_helper'

RSpec.feature 'leaving a comment' do
  scenario 'user can leave comment under post and see it' do
    visit '/'
    fill_in "post[message]", with: "Hello, world!"
    click_button "Create Post"
    visit '/'
    click_link('View Comments')
    fill_in "comment[message]", with: "test comment"
    click_button "Post Comment"
    expect(page).to have_content("test comment")
  end
end
