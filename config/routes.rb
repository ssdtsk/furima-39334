Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items do
    resources :orders, only: [:new, :create]
  end

  resources :users, only: [:new, :create]
  resources :orders, only: [:index, :create]
  post '/users/sign_up', to: 'users#create'
end