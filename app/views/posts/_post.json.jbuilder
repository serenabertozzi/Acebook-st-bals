json.extract! post, :id, :message, :likes_count, :created_at, :updated_at, :user_id
json.comments post.comments do |comment|
  json.partial! "comments/comment", comment: comment
end

if post.pictures.attached?
  json.images post.pictures.map{ |img| ({ url: url_for(img) }) }
end



# if params.fetch(:comments, false).to_bool
#   json.comments post.comments do |comment|
#     json.partial! "comments/comment", comment: comment
#   end
# end

json.url post_url(post, format: :json)
