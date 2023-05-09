Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: 'fishlists#index'
  resources :fishlists do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end
  resources :users, only: %i(index show) do
    member do
      get :followings, :followers
    end
    resource :follows, only: %i(create destroy)
  end
end
