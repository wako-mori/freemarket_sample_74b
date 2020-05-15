Rails.application.routes.draw do
  get 'creditcard/new'  
  get 'orders/index'   
  get 'users/show'
  # get 'creditcard/new'  #users情報を登録した後に削除
  # get 'orders/index'    #items情報を登録した後に削除

  root 'items#index'
  devise_for :users
 
  resources :items do
    collection do
      get "set_images"
      get "set_parents"
      get "set_children"
      get "set_grandchildren"
    end
    resources :orders, only: [:index] do
    end
  end

  resources :users, only: [:index, :new] do
    resources :creditcard, only: [:new] do
    end
  end
end
