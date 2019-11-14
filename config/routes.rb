Rails.application.routes.draw do
  resources :items

  devise_for :customers, path: :users

  root 'items#index'

  patch '/carts/info', to: 'carts#info'
  get '/carts/confirm', to: 'carts#confirm'
  get '/carts/index', to: 'carts#index'
  delete '/carts/:id/destroy', to: 'carts#destroy', as: :destroy_cart
  resources :items do
    resource :carts, only: [:create]
  end

  resources :orders

  #マイページ閲覧、基本情報の更新/編集、退会、
  scope :users do
    get    '/:id(.:format)',      to: 'users#show',    as: :show_customer
    patch  '/:id(.:format)',      to: 'users#update',  as: :update_customer
    get    '/:id/edit(.:format)', to: 'users#edit',    as: :edit_customer
    delete '/:id(.:format)',      to: 'users#destroy', as: :destroy_customer
  end

end
