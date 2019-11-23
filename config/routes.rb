Rails.application.routes.draw do

  ## エンドユーザ用
  root 'items#index'

  resources :items, only: [:index, :show]
  get '/search', to:'items#search'
  devise_for :customers, path: :users, controllers: { registrations: 'users/registrations' }

  #カート
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


  #マイページ閲覧、基本情報の更新/編集、退会、いいね一覧

  #マイページ閲覧、退会手続き画面、いいね一覧
  scope :users do
    get    '/:id(.:format)',       to: 'users#show',      as: :show_customer
    delete '/:id(.:format)',       to: 'users#destroy',   as: :destroy_customer
    get    '/:id/likes(.:format)', to: 'likes#index',     as: :likes
  end

  resources :deliveries, only: [:create, :destroy]

  ## 管理者用
  # 認証されたadminのみadmin/以下のURLにアクセスできます
  # admin以下のルートはnamespace以下に追加してください
  authenticated :admin do
    namespace :admin do
      get 'arrived_items/search', to:'arrived_items#search', as: :arrived_items_search
      resources :arrived_items
      get 'orders/search', to:'orders#search', as: :orders_search
      resources :orders
      resources :ready_items, only: [:create, :destroy, :index]
      resources :items
      get 'customers/search', to:'customers#search', as: :customers_search
      resources :customers, except: [:new]
      delete 'deliveries/:id(.:format)', to: 'deliveries#destroy',   as: :delivery
      # 情報マスタ用
      resources :info
      resources :artist,only: [:new,:create,:update,:destroy]
      resources :label,only: [:new,:create,:update,:destroy]
      resources :genre,only: [:new,:create,:update,:destroy]
      resources :tax,only: [:new,:create,:update]
      resources :tax_in_postage,only: [:new,:create,:update]
    end
  end

  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions:      'admins/sessions',
    passwords:     'admins/passwords'
  }

end
