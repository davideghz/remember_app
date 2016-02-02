Rails.application.routes.draw do
  get 'vehicles/create'

  get 'vehicles/destroy'

  devise_for :users
  root 'static_pages#home'
  resources :users,               only: [:show, :index]
  resources :vehicles,            only: [:create, :destroy]
end
