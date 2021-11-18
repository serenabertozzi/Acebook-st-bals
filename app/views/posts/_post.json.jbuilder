json.extract! post, :id, :message, :likes_count, :created_at, :updated_at, :user_id

if params.fetch(:comments, false).to_bool
  json.comments post.comments do |comment|
    json.partial! "comments/comment", comment: comment
  end
end

json.url post_url(post, format: :json)
