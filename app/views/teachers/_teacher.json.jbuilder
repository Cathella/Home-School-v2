json.extract! teacher, :id, :name, :phone, :grade, :subject, :address, :password_digest, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
