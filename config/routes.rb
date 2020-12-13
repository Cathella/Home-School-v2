Rails.application.routes.draw do
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

  resources :addresses
  get "myaddress", to: "home#myaddress", as: "my_address"
  get "teacheraddress", to: "home#teacheraddress", as: "teacher_address"
end
