Rails.application.routes.draw do
  devise_for :children
  root to: 'home#index'
  resources :addresses, :profiles, :directions, :details, :videos
  resources :groups do
    resources :members, only: [:create, :destroy]
  end
  get "accounts", to: "home#account", as: "accounts"
  get "dashboard", to: "home#dashboard", as: "dashboard"
  get "upscale", to: "home#upscale", as: "upscale"
  
  devise_for :admins
  devise_for :teachers
  
  # patch :to_trash, to: 'conversations#to_trash', as: :to_trash
  # patch :from_trash, to: 'conversations#from_trash', as: :from_trash
  # resources :conversations, :messages

  # post :black_list, to: 'blacklists#add_to_blacklist', as: :black_list
  # post :remove_from_blacklist, to: 'blacklists#remove_from_blacklist', as: :remove_from_blacklist
end
