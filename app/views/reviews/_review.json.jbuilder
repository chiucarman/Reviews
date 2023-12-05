json.extract! review, :id, :owner_id, :product_id, :rating, :would_repurchase, :body, :visibility, :published, :created_at, :updated_at
json.url review_url(review, format: :json)
