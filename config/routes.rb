Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "reviews#index"

  devise_for :users

  resources :media
  resources :follow_requests, except: [:index, :show, :new, :edit]
  resources :products
  resources :reviews

  get "/new" => "reviews#new", as: :new
  get "search", to: "search#index"
  get ":username/followers" => "users#followers", as: :followers
  get ":username/following" => "users#leaders", as: :leaders
  get ":username/pending" => "users#pending", as: :pending

  get ":username" => "users#show", as: :user
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
