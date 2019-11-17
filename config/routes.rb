Rails.application.routes.draw do
  get 'info/index'

  namespace :admin do
    resources :items
  end

  resources :items, only: [:index, :show]

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