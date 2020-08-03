Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :groups
  resources :edit_group, only: :index
  resources :destroy_group, only: :index
end
