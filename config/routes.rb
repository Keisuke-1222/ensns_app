Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks",
    :registrations => "registrations" }

  root 'home#index'
  resources :boards

  resources :comments do
    resources :like_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show]
  resources :notes
  resources :relationships, only: [:create, :destroy]

end
