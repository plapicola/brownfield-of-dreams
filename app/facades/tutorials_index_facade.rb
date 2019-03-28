# frozen_string_literal: true

class TutorialsIndexFacade
  def initialize(user)
    @user = user
  end

  def tutorials
    @tutorial ||= if @user
                    Tutorial.all
                  else
                    Tutorial.public_tutorials
                  end
  end
end
