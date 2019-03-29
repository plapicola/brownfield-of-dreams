# frozen_string_literal: true

module Admin
  # Handles tutorial management actions for admin users
  class TutorialsController < Admin::BaseController
    def edit
      @tutorial = Tutorial.find(params[:id])
      @video = Video.new
    end

    def create
      @tutorial = Tutorial.new(tutorial_params)
      if @tutorial.save
        flash[:success] = "Successfully created \"#{@tutorial.title}\"."
        redirect_to tutorial_path(@tutorial)
      else
        flash[:errors] = 'There are problems with the provided information.'
        render :new
      end
    end

    def new
      @tutorial = Tutorial.new
    end

    def update
      tutorial = Tutorial.find(params[:id])
      if tutorial.update(tutorial_params)
        flash[:success] = "#{tutorial.title} tagged!"
      end
      redirect_to edit_admin_tutorial_path(tutorial)
    end

    def destroy
      Tutorial.destroy(params[:id])
      redirect_to admin_dashboard_path
    end

    private

    def tutorial_params
      allowed = :title, :description, :thumbnail, :tag_list
      params.require(:tutorial).permit(allowed)
    end
  end
end
