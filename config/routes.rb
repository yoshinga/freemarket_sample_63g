Rails.application.routes.draw do

  root "items#index"
  devise_for :users 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items, only: [:index,:new, :edit, :create, :show, :update, :destroy] do
    member do
      get 'confirmation'
      post 'purchase'
      get 'purchase_end'
    end
  end
  resources :users, only: [:index, :edit, :update]

  resources :mypages, only: [:index] do
    collection do
      get 'card' # マイページ内のクレジットカード登録画面だよん
      get 'profile' # ユーザのプロフィール変更画面だよん
    end
  end
 
  resources :logout, only: [:index]
  resources :signup ,only: [:index, :create] do
      collection do
        get 'registration'
        post 'registration'
        get 'sms_confirmation'
        post 'sms_confirmation'
        post 'address'
        get 'address'
        post 'credit_card' # ここで、入力の全てが終了する
        post 'create'
        get 'done' #入力完了後のページ
    end
  end
  
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

end
