require 'rails_helper'

feature 'comments' do
  scenario 'comments show user' do
    register_and_sign_in
    create_test_post
    leave_test_comment
    visit '/'
    comment = find_by_id('commentCard')
    expect(comment).to have_content('test')
  end
end