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

  #マイページ閲覧、基本情報の更新/編集、退会、
  scope :users do
    get    '/:id(.:format)',      to: 'users#show',    as: :show_customer
    patch  '/:id(.:format)',      to: 'users#update',  as: :update_customer
    get    '/:id/edit(.:format)', to: 'users#edit',    as: :edit_customer
    delete '/:id(.:format)',      to: 'users#destroy', as: :destroy_customer
  end

end
