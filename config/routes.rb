Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items do
    resources :orders, only: [:index, :create]
  end

  resources :users, only: [:new, :create]
  post '/users/sign_up', to: 'users#create'
end