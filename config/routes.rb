Rails.application.routes.draw do

  root 'items#index'

  resources :items, only: [:index, :show]

  devise_for :customers, path: :users, controllers: { registrations: 'users/registrations' }

  get '/carts/index', to: 'carts#index'
  patch '/carts/update', to: 'carts#update'
  get '/carts/thanks', to: 'carts#thanks'
  post '/carts/info', to: 'carts#info'
  get '/carts/info', to: 'carts#info'
  get '/carts/confirm', to: 'carts#confirm'
  delete '/carts/:id/destroy', to: 'carts#destroy', as: :destroy_cart
  post '/cart/index', to: 'carts#in_cart_create_address', as: :cart_address

  resources :items do
    resource :carts, only: [:create]
    resource :likes, only: [:create, :destroy]
  end

  resources :orders do
    resource :order_details
  end

  namespace :admin do
    get '/ready_items/index', to: 'admin/ready_items#index'
    resources :items do
      resource :ready_items
    end
  end

  #マイページ閲覧、退会手続き画面、いいね一覧
  scope :users do
    get    '/:id(.:format)',       to: 'users#show',      as: :show_customer
    delete '/:id(.:format)',       to: 'users#destroy',   as: :destroy_customer
    get    '/:id/likes(.:format)', to: 'likes#index',     as: :likes
  end

  resources :deliveries, only: [:create, :destroy]

end

