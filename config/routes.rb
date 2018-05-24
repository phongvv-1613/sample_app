Rails.application.routes.draw do
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup",  to: "users#new"
  get "/login",   to: "sessions#new"
  post "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  resources :users
  resources :account_activations, only: [:edit]
<<<<<<< 0079611ff0eae1dd3eaeada8c346fdf441607103
=======
  resources :password_resets, only: [:new, :create, :edit, :update]
>>>>>>> Chapter 12
end
