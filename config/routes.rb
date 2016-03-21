Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#home'

  resources :users, only: [:show, :index] do
      resources :vehicles, only: [:show, :create, :edit, :update, :destroy] do
          resources :insurances, only: [:create, :edit, :update, :destroy]
      end
  end

  get 'sendemail'   => 'users#send_email'

end
