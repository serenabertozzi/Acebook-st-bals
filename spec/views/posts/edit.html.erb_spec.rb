require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      message: "MyString",
      likes_count: 1,
      image_url: "MyString"
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input[name=?]", "post[message]"

      assert_select "input[name=?]", "post[likes_count]"

      assert_select "input[name=?]", "post[image_url]"
    end
  end
end
