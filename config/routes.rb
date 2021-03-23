# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments, module: :posts
    resource :like, module: :posts, only: [:update]
    resource :unlike, module: :posts, only: [:update]
  end

  resources :conversations do
    resources :messages

    collection do
      get :inbox
      get :all, action: :index
      get :sent
      get :trash
    end
  end

  resources :profiles, except: [:new] do
    resource :follow, module: :profiles, only: [:update]
    resource :unfollow, module: :profiles, only: [:update]
  end

  resources :search, only: [:index]

  root 'home#index'
end
