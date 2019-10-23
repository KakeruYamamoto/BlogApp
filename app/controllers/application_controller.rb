class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
end




#（ヘルパーモジュールとは、そのモジュール内にメソッドを記述しておくことで、そのモジュールを含んだクラスでそのメソッドが使えるようになる機能のことです）

#Applicationコントローラにこのモジュールをインクルードする（含める）ことによって、Railsの全コントローラでこのモジュールが使用できるようになるので、設定しておきます。
