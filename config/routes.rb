Rails.application.routes.draw do

  get 'insurances/create'

  get 'insurances/edit'

  get 'insurances/update'

  get 'insurances/destroy'

  devise_for :users
  root 'static_pages#home'

  resources :users, only: [:show, :index] do
    member do
      resources :vehicles, only: [:create, :edit, :update, :destroy]
    end
  end

  get 'sendemail'   => 'users#send_email'

end
