Rails.application.routes.draw do
  devise_for :users, controllers: { :omniouth_callbacks => "omniauth_callbacks" }
  root 'home#index'
  resources :boards
  resources :comments, only: [:create, :destroy]
end
