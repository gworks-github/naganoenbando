Rails.application.routes.draw do

  get 'info/index'

  root 'items#index'

  resources :items, only: [:index, :show]
  post '/search', to:'items#search'
  devise_for :customers, path: :users, controllers: { registrations: 'users/registrations' }

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

  #マイページ閲覧、退会手続き画面、いいね一覧
  scope :users do
    get    '/:id(.:format)',       to: 'users#show',      as: :show_customer
    delete '/:id(.:format)',       to: 'users#destroy',   as: :destroy_customer
    get    '/:id/likes(.:format)', to: 'likes#index',     as: :likes
  end

  resources :deliveries, only: [:create, :destroy]

end

