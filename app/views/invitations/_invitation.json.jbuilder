json.extract! user, :user_id, :friend_id, :confirmed, :created_at, :updated_at
json.url user_url(post, format: :json)
