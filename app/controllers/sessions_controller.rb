class SessionsController < ApplicationController
  #ログイン前はcurrent_userが無いので、login_requiredのチェックをスキップする
  skip_before_action :login_required

  def new
  end

  #ログイン処理
  def create
    #メールアドレスでユーザーを検索
    user = User.find_by(email: session_params[:email])

    #ユーザーが見つかった場合、authenticateメソッドでパスワードによる認証を行う
    if user&.authenticate(session_params[:password])
      #認証に成功した場合、セッションにuser_idを格納する
      session[:user_id] = user.id

      redirect_to root_path, notice: 'ログインしました。'
    else
      render :new
    end
  end

  #ログアウト処理
  def destroy
    #セッション情報を全て削除
    reset_session

    redirect_to root_path, notice: 'ログアウトしました。'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
