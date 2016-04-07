Rails.application.routes.draw do

  scope "(:locale)" do
    root 'static_pages#home'
    devise_for :users

    resources :users, only: [:show, :index] do
        resources :vehicles, only: [:show, :create, :edit, :update, :destroy] do
            resources :insurances, only: [:create, :edit, :update, :destroy]
        end
    end
  end

  get 'sendemail'   => 'users#send_email'

end
