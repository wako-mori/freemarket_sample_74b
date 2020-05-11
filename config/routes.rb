Rails.application.routes.draw do
  get 'creditcard/new'  
  get 'orders/index'   
  get 'users/show'
  root 'items#index'

  resources :items do
    resources :orders, only: [:index] do
    end
  end

  resources :users, only: [:index, :new] do
    resources :creditcard, only: [:new] do
    end
  end
end
