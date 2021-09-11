class ApplicationController < ActionController::Base
  #Basic認証
  before_action :basic_auth
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  #ログインしていないユーザーをログイン画面に遷移
  before_action :authenticate_user! ,only: [:new]

  private
  #Basic認証
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  #新規登録画面でのバリデーション
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:nickname,:lastname,:firstname,:lastname_kana,:firstname_kana,:birthday])
  end
end
