Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments, module: :posts
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

  root 'home#index'
end
