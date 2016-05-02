Rails.application.routes.draw do

  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  scope "(:locale)" do
    root 'static_pages#home'
    post '/' => 'static_pages#home'

    devise_for :users, skip: :omniauth_callbacks

    resources :users, only: [:show, :index, :update, :destroy] do
      resources :vehicles, only: [:show, :create, :edit, :update, :destroy] do
        member do
          get :edit_image
        end
        resources :insurances, only: [:create, :edit, :update, :destroy]
      end
    end

    get 'sendemail'   => 'users#send_email'
  end

  namespace :api, defaults: { format: 'json' }  do
    namespace :v1 do
      resources :users, only: [:show, :index, :create]
      resources :vehicles, only: [:index]
    end
  end

end
