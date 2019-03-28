# frozen_string_literal: true

class InvitesController < ApplicationController
  before_action :require_github_user

  def create
    begin
      InviteMailer.invite(current_user, params[:github_handle]).deliver_now
      flash[:success] = 'Successfully sent invite!'
    rescue StandardError
      flash.clear
      flash[:error] = "The Github user you selected doesn't have an email address associated with their account."
    end
    redirect_to dashboard_path
  end
end
