# frozen_string_literal: true

# Handles user registration and dashboard
class UsersController < ApplicationController
  before_action :require_validated_login, only: :show

  def show
    render locals: {
      facade: DashboardFacade.new(current_user)
    }
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      onboard_user
    else
      flash[:error] = 'There are problems with the provided information.'
      render :new
    end
  end

  private

  def user_params
    fields = :email, :first_name, :last_name, :password, :password_confirmation
    params.require(:user).permit(fields)
  end

  def onboard_user
    session[:user_id] = @user.id
    redirect_to validation_landing_path
  end
end
