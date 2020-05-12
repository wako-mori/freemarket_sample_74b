Rails.application.routes.draw do
  get 'orders/index'   #items情報を登録した後に削除
  get 'users/show'
  

  root 'items#index'
  devise_for :users
 
  resources :items do
    resources :orders, only: [:index] do
    end
  end

  resources :user, only: [:index, :new] do
  end

  resources :creditcard, only: [:new, :show] do
    collection do
      post 'show', to: 'creditcard#show'
      post 'pay', to: 'creditcard#pay'
      post 'delete', to: 'creditcard#delete'
    end
  end
end
