Rails.application.routes.draw do
  # get 'teacher_sessions/new'
  resources :teachers
  resources :teacher_sessions
  root to: "teachers#index"
end
