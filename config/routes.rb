Rails.application.routes.draw do
  # get 'creditcard/new'  #users情報を登録した後に削除
  # get 'orders/index'    #items情報を登録した後に削除

  root 'items#index'
  devise_for :users
  resources :items do
    resources :orders, only: [:index] do
    end
  end

  resources :user do
    resources :creditcard, only: [:new] do
    end
  end

  resources :addresses, only: [:new, :create]
end
