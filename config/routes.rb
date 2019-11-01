Rails.application.routes.draw do
  resources :contacts
  root to: 'sessions#new'
  resources :favorites, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :blogs do
    collection do #idを必要としない固有のルーティングを生成。
      #member doを使うとidを必要とする固有のルーティングを生成。
      #resources :blog とすると、どのパスにもideaを必要としないルーティングを生成できる。
      post :confirm #HTTPメソにconfirmアクションを設定
    end
  end
  resources :feeds do
    collection do
      post :confirm
    end
  end
end
