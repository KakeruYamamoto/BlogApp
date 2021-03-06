class UsersController < ApplicationController


  def index
    @users = User.all
  end
  
  def new
   @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save#保存の失敗とはバリデーションによる保存の失敗
       redirect_to user_path(@user.id)# 保存の成功した場合の処理
    else
      render 'new'
    end
  end

  def show
     @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
