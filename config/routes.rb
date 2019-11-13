Rails.application.routes.draw do

  resources :items
  root 'items#index'

  devise_scope :customer do
    get    'users/sign_in'         => 'devise/sessions#new', as: :new_user_session
    post   'users/sign_in'         => 'devise/sessions#create', as: :user_session
    delete 'users/sign_out'        => 'devise/sessions#destroy', as: :destroy_user_session
    get    'users/password/new'    => 'devise/passwords#new', as: :new_user_password
    get    'users/password/edit'   => 'devise/passwords#edit', as: :edit_user_password
    patch  'users/password'        => 'devise/passwords#update'
    put    'users/password'        => 'devise/passwords#update', as: :update_user_password
    post   'users/password'        => 'devise/passwords#create', as: :user_password
    get    'users/cancel'          => 'devise/registrations#cancel', as: :cancel_user_registration
    get    'users/sign_up'         => 'devise/registrations#new', as: :new_user_registration
    get    'users/edit'            => 'devise/registrations#edit', as: :edit_user_registration
    patch  'users/user'            => 'devise/registrations#update', as: nil
    put    'users/user'            => 'devise/registrations#update', as: :update_user_registration
    delete 'users/user'            => 'devise/registrations#destroy', as: :destroy_user_registration
    post   'users/signup'          => 'devise/registrations#create', as: :user_registration
  end

  devise_for :customers

  get '/carts/info', to: 'carts#info'
  get '/carts/confirm', to: 'carts#confirm'
  resources :carts, only: [:index, :create, :destroy, :new]

end
