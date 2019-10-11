Rails.application.routes.draw do

  resources :blogs do
    collection do #idを必要としない固有のルーティングを生成。
      #member doを使うとidを必要とする固有のルーティングを生成。
      #resources :blog とすると、どのパスにもideaを必要としないルーティングを生成できる。
      post :confirm #HTTPメソにconfirmアクションを設定
    end
  end
end
