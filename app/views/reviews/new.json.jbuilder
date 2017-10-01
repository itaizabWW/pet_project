json.partial! "reviews/review", review: @review
json.extract! review, :id, :name, :rating, :comment, :created_at, :updated_at
json.url review_url(review, format: :json)