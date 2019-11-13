Rails.application.routes.draw do

  resources :items

  devise_for :customers, path: :users

  get '/carts/info', to: 'carts#info'
  get '/carts/confirm', to: 'carts#confirm'
  resources :carts, only: [:index, :create, :destroy, :new]
  resources :orders
end
