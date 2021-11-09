# require 'rails_helper'

# RSpec.describe "posts/index", type: :view do
#   before(:each) do
#     assign(:posts, [
#       Post.create!(
#         message: "Message",
#         likes_count: 2,
#         image_url: "Image Url"
#       ),
#       Post.create!(
#         message: "Message",
#         likes_count: 2,
#         image_url: "Image Url"
#       )
#     ])
#   end

#   it "renders a list of posts" do
#     render
#     assert_select "tr>td", text: "Message".to_s, count: 2
#     assert_select "tr>td", text: 2.to_s, count: 2
#     assert_select "tr>td", text: "Image Url".to_s, count: 2
#   end
# end
