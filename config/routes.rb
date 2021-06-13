Rails.application.routes.draw do
  devise_for :admins
  devise_for :children
  devise_for :teachers
  # resources :conversations, :messages

  root to: 'home#index'
  
  resources :children do
    resources :addresses, module: :children
    resources :profiles, module: :children
  end

  resources :teachers do
    resources :directions, module: :teachers
    resources :details, module: :teachers
  end

  resources :groups

  get "accounts", to: "home#account", as: "accounts"
  get "dashboard", to: "home#dashboard", as: "dashboard"
  
  # patch :to_trash, to: 'conversations#to_trash', as: :to_trash
  # patch :from_trash, to: 'conversations#from_trash', as: :from_trash

  # post :black_list, to: 'blacklists#add_to_blacklist', as: :black_list
  # post :remove_from_blacklist, to: 'blacklists#remove_from_blacklist', as: :remove_from_blacklist
end
