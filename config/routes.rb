Rails.application.routes.draw do

  root "view#index"
  devise_for :users 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items, only: [:new]
  
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
