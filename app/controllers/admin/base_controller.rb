# frozen_string_literal: true

module Admin
  # Shared actions for admin controllers
  class BaseController < ApplicationController
    before_action :require_admin!

    def require_admin!
      four_oh_four unless current_user.admin?
    end
  end
end
