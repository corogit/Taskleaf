class ApplicationController < ActionController::Base
  # 全てのビューから利用可能にする
  helper_method :current_user
  
  private
  # 全てのコントローラーから利用可能にする
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
