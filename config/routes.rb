Rails.application.routes.draw do

  root "view#index"
  devise_for :users 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
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
