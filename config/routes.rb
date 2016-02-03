Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#home'
  resources :users,               only: [:show, :index]
  resources :vehicles,            only: [:create, :edit, :update, :destroy]

end
