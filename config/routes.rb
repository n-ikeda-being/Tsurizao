Rails.application.routes.draw do
  root 'fishlists#index'
  resources :fishlists
end
