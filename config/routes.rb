Rails.application.routes.draw do
  devise_for :users
  get '/carts/info', to: 'carts#info'
  get '/carts/confirm', to: 'carts#confirm'
  resources :carts, only: [:index, :create, :destroy, :new]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
