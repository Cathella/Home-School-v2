json.extract! post, :id, :description, :subject, :grade, :meeting, :budget, :gender, :tutors_number, :commitment, :created_at, :updated_at
json.url post_url(post, format: :json)
