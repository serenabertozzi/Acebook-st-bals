json.extract! post, :id, :message, :likes_count, :image_url, :video_url, :created_at, :updated_at
json.url post_url(post, format: :json)
