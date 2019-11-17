Rails.application.routes.draw do
  namespace :admin do
    get 'items/new'
  end

  resources :items, only: [:index, :show]

  devise_for :customers, path: :users

  root 'items#index'

  patch '/carts/info', to: 'carts#info'
  get '/carts/confirm', to: 'carts#confirm'
  get '/carts/index', to: 'carts#index'
  delete '/carts/:id/destroy', to: 'carts#destroy', as: :destroy_cart

  resources :items do
    resource :carts, only: [:create]
    resource :likes, only: [:create, :destroy]
  end

  resources :orders

  namespace :admin do
    resources :items
  end

  #マイページ閲覧、基本情報の更新/編集、退会、いいね一覧
  scope :users do
    get    '/:id(.:format)',       to: 'users#show',      as: :show_customer
    patch  '/:id(.:format)',       to: 'users#update',    as: :update_customer
    get    '/:id/edit(.:format)',  to: 'users#edit',      as: :edit_customer
    delete '/:id(.:format)',       to: 'users#destroy',   as: :destroy_customer
    get    '/:id/likes(.:format)', to: 'likes#index',     as: :likes
  end

  resources :deliveries, only: [:create, :destroy]

end

