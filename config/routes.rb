Rails.application.routes.draw do

  root "view#index"
  devise_for :users 

  resources :mypages, only: [:index]
 
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
