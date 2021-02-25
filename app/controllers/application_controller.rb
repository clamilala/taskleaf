class ApplicationController < ActionController::Base
    #helper_method指定して全てのビューから使用できるようにする
    helper_method :current_user

    ##フィルター
    #アクションの前にlogin_requiredを実行する
    #※ログインしなければ使用できないようにする
    before_action :login_required

    #プライベートメソッド
    private

    #ログインユーザーを取得するメソッド
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    #ログインユーザーが存在しない場合（unless current_user）、
    #ログイン画面に戻す（redirect_to login_path）
    def login_required
        redirect_to login_path unless current_user
    end

end
