Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#home'

  resources :users, only: [:show, :index] do
    member do
      resources :vehicles, only: [:create, :edit, :update, :destroy]
    end
  end

  get 'sendemail'   => 'users#send_email'

end
