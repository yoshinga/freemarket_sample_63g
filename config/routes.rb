Rails.application.routes.draw do
  get 'users/index'
  devise_for :users 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :edit, :update]
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
