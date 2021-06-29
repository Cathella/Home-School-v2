Rails.application.routes.draw do
  devise_for :children, :admins, :teachers

  root to: 'home#index'
  resources :addresses, :profiles, :directions, :details, :videos
  resources :groups do
    resources :members, only: [:create, :destroy]
  end
  
  get "accounts", to: "home#account", as: "accounts"
  get "dashboard", to: "home#dashboard", as: "dashboard"
  get "upscale", to: "home#upscale", as: "upscale"

end
