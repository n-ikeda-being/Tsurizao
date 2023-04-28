Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: 'fishlists#index'
  resources :fishlists do
    resources :comments
  end
  resources :users, only: [:index, :show]
end
