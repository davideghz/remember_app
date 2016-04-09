Rails.application.routes.draw do

  scope "(:locale)" do
    root 'static_pages#home'
    devise_for :users

    resources :users, only: [:show, :index] do
      resources :vehicles, only: [:show, :create, :edit, :update, :destroy] do
        member do
          get :edit_image
        end
        resources :insurances, only: [:create, :edit, :update, :destroy]
      end
    end

    get 'sendemail'   => 'users#send_email'
  end

end
