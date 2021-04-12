Rails.application.routes.draw do
  resources :profiles, :posts, :videos, :groups, :conversations, :messages
  resources :child_sessions, :teacher_sessions, :admins, :admin_sessions
  resources :contacts, :teacher_password_resets, :password_resets, :directions, :addresses

  root to: 'home#index'

  resources :children do
    member do
      get :confirm_email
    end
  end
  resources :teachers do
    member do
      get :confirm_email
    end
  end

  get "/teachershome", to: "teachers#teachershome", as: :teachershome 
  get "lessons", to: "home#lessons", as: "lessons"
  get "joined", to: "home#joined", as: "joined"
  get "privateaching", to: "home#privateaching", as: "privateaching"
  get "mygroup", to: "home#mygroup", as: "my_group"
  get "teachergroup", to: "home#teachergroup", as: "teacher_group"
  get "/childrenhome", to: "children#childrenhome", as: :childrenhome
  get "myaddress", to: "home#myaddress", as: "my_address"
  get "teacheraddress", to: "home#teacheraddress", as: "teacher_address"
  get "accounts", to: "home#account", as: "accounts"
  get 'messages/create'
  
  patch :to_trash, to: 'conversations#to_trash', as: :to_trash
  patch :from_trash, to: 'conversations#from_trash', as: :from_trash

  post :black_list, to: 'blacklists#add_to_blacklist', as: :black_list
  post :remove_from_blacklist, to: 'blacklists#remove_from_blacklist', as: :remove_from_blacklist
end
