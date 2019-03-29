# frozen_string_literal: true

# Facade for the tutorials index
class TutorialsIndexFacade
  def initialize(user)
    @user = user
  end

  def tutorials
    @tutorials ||= if @user
                     Tutorial.all
                   else
                     Tutorial.public_tutorials
                   end
  end
end
