class ApplicationController < ActionController::Base
  # 全てのビューから利用可能にする
  helper_method :current_user
  before_action :login_required
  
  private
  # 全てのコントローラーから利用可能にする
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  def login_required
    redirect_to login_url unless current_user
  end
end
