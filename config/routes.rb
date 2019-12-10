Rails.application.routes.draw do

  root "items#index"
  # devise_for :users 
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items, only: [:index,:new, :create, :show, :destroy] do
    collection do
      get 'purchase'
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
        post 'sms_confirmation'
        post 'address'
        post 'credit_card' # ここで、入力の全てが終了する
        post 'create'
        get 'done' #入力完了後のページ
    end
  end
end
