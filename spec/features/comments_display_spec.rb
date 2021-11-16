require 'rails_helper'

feature 'comments' do

  scenario 'comments show user' do
    register_and_sign_in
    create_test_post
    leave_test_comment
    
    comment = find_by_id('commentCard')
    expect(comment).to have_content('Bilbo Baggins')
  end

  scenario 'comments show user picture' do
    register_and_sign_in
    create_test_post
    leave_test_comment

    comment = find_by_id('commentCard')
    expect(comment).to have_css("img[src*='teamlogo.png']")
  end

  scenario 'comments show time posted' do
    register_and_sign_in
    create_test_post
    leave_test_comment

    comment = find_by_id('commentCard')
    expect(comment).to have_content("Posted less than a minute ago.")
  end
end