class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def user_signed_in?
    session[:user_id].present?
  end

  def authenticate_user!
    redirect_to login_path unless user_signed_in?
  end
end
