Rails.application.routes.draw do

  post 'profile/:id/follow', to: 'profile#follow', as: 'follow'
  post 'profile/:id/unfollow', to: 'profile#unfollow', as: 'unfollow'
  post 'profile/:id/accept', to: 'profile#accept', as: 'accept'
  post 'profile/:id/decline', to: 'profile#decline', as: 'decline'
  post 'profile/:id/cancel', to: 'profile#cancel', as: 'cancel'

  get 'profile/:id', to: 'profile#show', as: 'profile'
  root "home#index"
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :likes, only: [:create, :destroy]
  resources :follow_requests
  resources :followers
  resources :following
  resources :home
  devise_for :users, :path_prefix => 'my'
  resources :users
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
end
