Rails.application.routes.draw do
  resources :directions
  root to: 'home#index'

  resources :groups
  get "mygroup", to: "home#mygroup", as: "my_group"
  get "teachergroup", to: "home#teachergroup", as: "teacher_group"

  resources :children
  get "/childrenhome", to: "children#childrenhome", as: :childrenhome
  resources :child_sessions
  
  resources :teachers
  get "/teachershome", to: "teachers#teachershome", as: :teachershome
  resources :teacher_sessions

  resources :admins
  resources :admin_sessions
  # get "/admin", to: "admin#index", as: :admin

  resources :addresses
  get "myaddress", to: "home#myaddress", as: "my_address"
  get "teacheraddress", to: "home#teacheraddress", as: "teacher_address"
end
