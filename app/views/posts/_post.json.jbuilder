json.extract! post, :id, :description, :location, :ratings, :diary_type, :created_at, :updated_at
json.url post_url(post, format: :json)
