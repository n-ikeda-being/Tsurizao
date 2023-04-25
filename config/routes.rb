Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  get '/', to: 'fishlists#index'
  resources :fishlists
  resources :users, only: [:index, :show]
end
