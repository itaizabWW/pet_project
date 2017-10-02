json.extract! restaurant, :id, :name, :cuisine, :rating, :tenbis, :address, :kosher, :maxDevTime, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
