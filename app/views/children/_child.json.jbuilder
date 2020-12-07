json.extract! child, :id, :name, :phone, :grade, :guardian, :address, :password_digest, :created_at, :updated_at
json.url child_url(child, format: :json)
