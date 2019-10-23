module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def logged_in?
    current_user.present?
  end
end
#layouts/application.html


#自己代入
# 同じ  =>  @current_user || @current_user = User.find_by(id: session[:user_id])
#@current_userが真の場合はそのままにし、偽の場合は右辺の値 User.find_by(id: session[:user_id]) を代入するというものです。
