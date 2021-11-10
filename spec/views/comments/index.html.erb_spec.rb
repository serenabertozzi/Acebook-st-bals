require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        comment_text: "Comment Text"
      ),
      Comment.create!(
        comment_text: "Comment Text"
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", text: "Comment Text".to_s, count: 2
  end
end
