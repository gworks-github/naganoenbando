Rails.application.routes.draw do
  namespace :admin do
    get 'items/new'
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

  namespace :admin do
    resources :items
  end


end