Rails.application.routes.draw do
  resources :addresses
  resources :groups
  root to: 'home#index'

  resources :children
  get "/childrenhome", to: "children#childrenhome", as: :childrenhome
  resources :child_sessions
  
  resources :teachers
  get "/teachershome", to: "teachers#teachershome", as: :teachershome
  resources :teacher_sessions

  resources :admin_sessions
  get "/admin", to: "admin#index", as: :admin
end
