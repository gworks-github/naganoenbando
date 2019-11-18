Rails.application.routes.draw do

  root 'items#index'

  namespace :admin do
    get 'items/new'
  end

  resources :items, only: [:index, :show]

  devise_for :customers, path: :users, controllers: { registrations: 'users/registrations' }

  patch '/carts/update', to: 'carts#update'
  get '/carts/thanks', to: 'carts#thanks'
  get '/carts/info', to: 'carts#info'
  get '/carts/confirm', to: 'carts#confirm'
  get '/carts/index', to: 'carts#index'
  delete '/carts/:id/destroy', to: 'carts#destroy', as: :destroy_cart
  post '/cart/index', to: 'carts#in_cart_create_address', as: :cart_address

  resources :items do
    resource :carts, only: [:create]
    resource :likes, only: [:create, :destroy]
  end

  resources :orders

  namespace :admin do
    resources :items
  end

  #マイページ閲覧、退会手続き画面、いいね一覧
  scope :users do
    get    '/:id(.:format)',       to: 'users#show',      as: :show_customer
    delete '/:id(.:format)',       to: 'users#destroy',   as: :destroy_customer
    get    '/:id/likes(.:format)', to: 'likes#index',     as: :likes
  end

  resources :deliveries, only: [:create, :destroy]

end

