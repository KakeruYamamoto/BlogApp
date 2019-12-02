module SessionsHelper
  def current_user#ログイン中のユーザを取得するメソッド
    @current_user ||= User.find_by(id: session[:user_id])
  end
  #SessionsControllerに↓
  # session[:user_id] = user.id#このコードを実行すると、ユーザーのブラウザ内のcookiesに暗号化されたユーザーIDが自動で生成されます。#左辺はsessionメソッド  ユーザidが自動で生成されます。
  def logged_in?#ユーザーがログインしていればtrue、その他ならfalseを返すメソッド
    current_user.present?
  end
end
#layouts/application.html


#自己代入
# 同じ  =>  @current_user || @current_user = User.find_by(id: session[:user_id])
#@current_userが真の場合はそのままにし、偽の場合は右辺の値 User.find_by(id: session[:user_id]) を代入するというものです。


#sessionhelperを全クラスで使用したいのであればcomtroller/application_controllerに設定する。
