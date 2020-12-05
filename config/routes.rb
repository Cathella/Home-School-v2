Rails.application.routes.draw do
  root to: 'home#index'

  resources :children
  get "/childrenhome", to: "children#childrenhome", as: :childrenhome
  resources :child_sessions
  
  resources :teachers
  get "/teachershome", to: "teachers#teachershome", as: :teachershome
  resources :teacher_sessions

  resources :admin_sessions
end
