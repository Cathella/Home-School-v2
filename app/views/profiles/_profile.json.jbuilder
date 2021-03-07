json.extract! profile, :id, :per_charge, :fee, :experience, :commitment, :description, :created_at, :updated_at
json.url profile_url(profile, format: :json)
