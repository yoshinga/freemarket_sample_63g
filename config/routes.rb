Rails.application.routes.draw do

  root "items#index"
  devise_for :users 

  resources :items, only: [:index, :new, :create]
  resources :users, only: [:index, :edit, :update]

  resources :mypages, only: [:index] do
    collection do
      get 'card' # マイページ内のクレジットカード登録画面だよん
      get 'profile' # ユーザのプロフィール変更画面だよん
    end
  end
 
  resources :logout, only: [:index]

  resources :signup do
    collection do
      get 'registration'
      get 'sms_confirmation'
      get 'address'
      get 'credit_card' # ここで、入力の全てが終了する
      get 'done' #入力完了後のページ
    end
  end

end
