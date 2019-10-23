class SessionsController < ApplicationController
  def new
    @usar = User.new
  end

  def create
   user = User.find_by(email: params[:session][:email].downcase)#メールアドレスをすべて小文字で保存していているので、downcaseメソッドを使用して、有効なメールアドレスが入力されたときに確実にマッチするようにしています。
   if user && user.authenticate(params[:session][:password])
     session[:user_id] = user.id#このコードを実行すると、ユーザーのブラウザ内のcookiesに暗号化されたユーザーIDが自動で生成されます。
     redirect_to user_path(user.id)
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render 'new'
    end
  end

end
