Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  #上記の記述で  /letter_openerのURLにアクセスした時、下記のようなメール送信BOXが出現
  resources :relationships, only: [:create, :destroy]

  resources :contacts
  root to: 'sessions#new'
  resources :favorites, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :index]
  resources :blogs do
    resources :comments
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
