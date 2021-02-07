json.extract! article, :id, :title, :body, :tag_id, :created_at, :updated_at
json.url article_url(article, format: :json)
