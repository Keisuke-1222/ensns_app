Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { :omniouth_callbacks => "omniauth_callbacks" }
  root 'home#index'
  resources :boards
  resources :comments, only: [:create, :destroy]
  resources :users, only: [:index, :show]
end
