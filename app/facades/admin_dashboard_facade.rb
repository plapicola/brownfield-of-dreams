# frozen_string_literal: true

# Facade for the admin dashboard
class AdminDashboardFacade
  def tutorials
    Tutorial.all
  end
end
