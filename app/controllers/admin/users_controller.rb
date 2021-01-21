class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    #Userインスタンスを作成し、@userに代入
    @user = User.new(user_params)

    #@userを保存
    if @user.save
      #登録成功時
      redirect_to admin_users_path, notice: "ユーザー「#{@user.name}」を登録しました。"
    else
      #登録失敗時
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    #@userを更新
    if @user.update(user_params)
      #更新成功時
      redirect_to admin_users_path(@user), notice: "ユーザー「#{@user.name}」を更新しました。"
    else
      #更新失敗時
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url, notice: "ユーザー「#{@user.name}」を削除しました。"
  end

  #プライベートメソッド
  private
  
  def user_params
    #ストロングパラメーター
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
end
