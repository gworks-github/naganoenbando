Rails.application.routes.draw do
  resources :items

  devise_for :customers, path: :users

  root 'items#index'

  get '/carts/info', to: 'carts#info'
  get '/carts/confirm', to: 'carts#confirm'
  get '/carts/index', to: 'carts#index'
  resources :items do
    resource :carts, only: [:index, :create, :destroy, :new]
  end
  
  resources :orders
end