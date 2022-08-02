class ApplicationController < ActionController::API
  #sorceryが作成するメソッド。ログインしてない時not_authenticatedメソッドを発火する
  before_action :require_login

  protected

  def not_authenticated
    redirect_to login_url
  end
end
