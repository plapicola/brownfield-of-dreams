# frozen_string_literal: true

module Admin
  # Shows admin dashboard
  class DashboardController < Admin::BaseController
    def show
      @facade = AdminDashboardFacade.new
    end
  end
end
