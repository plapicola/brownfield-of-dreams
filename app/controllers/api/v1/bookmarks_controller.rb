class Api::V1::BookmarksController < ApplicationController

  def create
    return head(302) if current_user.user_videos.find_by(user_video_params)
    render json: UserVideoSerializer.new(current_user.user_videos.find_or_create_by(user_video_params))
  end

  private

  def user_video_params
    params.require(:bookmark).permit(:video_id)
  end
end
