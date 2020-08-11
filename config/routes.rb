Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :groups do
    resources :tasks, only: %i[new create edit update destroy]
  end
  resources :edit_group, only: :index
  resources :destroy_group, only: :index
  get 'users/index'
end
