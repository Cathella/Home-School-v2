Rails.application.routes.draw do
  resources :children
  root to: 'home#index'
  resources :teachers
  get "/teachershome", to: "teachers#teachershome", as: :teachershome
  resources :teacher_sessions
end
