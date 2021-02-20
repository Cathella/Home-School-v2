json.extract! contact, :id, :name, :address, :phone, :user-type, :message, :created_at, :updated_at
json.url contact_url(contact, format: :json)
