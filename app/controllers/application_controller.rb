# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :find_bookmark
  helper_method :list_tags
  helper_method :tutorial_name

  add_flash_types :success

  def current_user
    @current_user ||= User.includes(:friend_users).find(session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to root_path unless current_user
  end

  def require_github_user
    redirect_to root_path unless current_user&.github_token
  end

  def require_validated_login
    flash[:error] = 'You must verify your email to continue.' if current_user && !current_user.verified
    redirect_to login_path unless current_user&.verified
  end

  def require_unverified_login
    redirect_to root_path unless current_user
    redirect_to dashboard_path if current_user.verified
  end
end
