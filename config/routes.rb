Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: 'fishlists#index'
  resources :fishlists do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show] do
    member do
      get :followings, :followers
    end
    resource :follows, only: [:create, :destroy]
  end
end
