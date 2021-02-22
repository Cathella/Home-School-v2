Rails.application.routes.draw do
  resources :videos
  get "lessons", to: "home#lessons", as: "lessons"
  
  resources :contacts

  resources :teacher_password_resets
  resources :password_resets

  resources :directions
  root to: 'home#index'

  get "joined", to: "home#joined", as: "joined"

  resources :groups
  get "mygroup", to: "home#mygroup", as: "my_group"
  get "teachergroup", to: "home#teachergroup", as: "teacher_group"

  resources :children do
    member do
      get :confirm_email
    end
  end

  get "/childrenhome", to: "children#childrenhome", as: :childrenhome
  resources :child_sessions
  
  resources :teachers do
    member do
      get :confirm_email
    end
  end
  get "/teachershome", to: "teachers#teachershome", as: :teachershome
  resources :teacher_sessions

  resources :admins
  resources :admin_sessions
  # get "/admin", to: "admin#index", as: :admin

  resources :addresses
  get "myaddress", to: "home#myaddress", as: "my_address"
  get "teacheraddress", to: "home#teacheraddress", as: "teacher_address"
end
