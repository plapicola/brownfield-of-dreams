# frozen_string_literal: true

module Admin
  # Controlls video interactions when logged in as an admin
  class VideosController < Admin::BaseController
    def edit
      @video = Video.find(params[:id])
    end

    def update
      video = Video.find(params[:id])
      video.update(new_video_params)
      redirect_to edit_admin_tutorial_path(video.tutorial)
    end

    def create
      begin
        tutorial = Tutorial.find(params[:tutorial_id])
        create_helper(tutorial)
        flash[:success] = 'Successfully created video.'
      rescue StandardError # Update to handle more verbose errors in future
        flash[:error] = 'Unable to create video.'
      end
      redirect_to edit_admin_tutorial_path(id: tutorial.id)
    end

    private

    def create_helper(tutorial)
      image = YouTube::Video.by_id(new_video_params[:video_id]).thumbnail
      video = tutorial.videos.new(new_video_params.merge(thumbnail: image))

      video.save
    end

    def video_params
      params.permit(:position)
    end

    def new_video_params
      params.require(:video).permit(:title, :description, :video_id, :thumbnail)
    end
  end
end
