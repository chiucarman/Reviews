Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "reviews#index"

  devise_for :users

  resources :media
  resources :follow_requests
  resources :products
  resources :reviews
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
