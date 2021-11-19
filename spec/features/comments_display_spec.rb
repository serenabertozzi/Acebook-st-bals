require 'rails_helper'

feature 'Comments' do

  scenario 'Comments display their author' do
    only_register
    create_test_post
    leave_test_comment
    
    comment = find_by_id('commentCard')
    expect(comment).to have_content('Bilbo Baggins')
  end

  scenario 'Comments show the author profile picture picture' do
    only_register
    create_test_post
    leave_test_comment

    comment = find_by_id('commentCard')
    expect(comment).to have_css("img[src*='teamlogo.png']")
  end

  scenario 'Comments show when they were posted' do
    only_register
    create_test_post
    leave_test_comment

    comment = find_by_id('commentCard')
    expect(comment).to have_content("less than a minute ago.")
  end
end