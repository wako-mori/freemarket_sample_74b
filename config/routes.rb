Rails.application.routes.draw do 

  root 'items#index'
  devise_for :users
 
  resources :items do
    collection do
      # get "set_images"
      # 編集箇所ここから
      get "set_parents"
      get "set_children"
      get "set_grandchildren"
      # 編集箇所ここまで
    end
    resources :orders, only: [:index] do
      collection do
        get 'done', to: 'orders#done'
        post 'pay', to: 'orders#pay'
      end
    end
  end

  resources :users, only: [:index, :new, :show] do
  end

  resources :creditcard, only: [:new, :show] do
    collection do
      post 'show', to: 'creditcard#show'
      post 'pay', to: 'creditcard#pay'
      post 'delete', to: 'creditcard#delete'
    end
  end
end
