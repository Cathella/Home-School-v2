Rails.application.routes.draw do
  root to: 'home#index'
  resources :teachers
  resources :teacher_sessions
end
