Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :item, only: [:index, :new, :create, :show, :edit, :update, :destroy] 
  resources :users, only: [:new, :create]
  post '/users/sign_up', to: 'users#create'
end