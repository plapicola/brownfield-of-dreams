# frozen_string_literal: true

module Api
  module V1
    # Controls Bookmark returns from the API
    class BookmarksController < ApplicationController
      def create
        return head(302) if current_user.user_videos.find_by(user_video_params)

        user = current_user.user_videos.find_or_create_by(user_video_params)
        render json: UserVideoSerializer.new(user)
      end

      private

      def user_video_params
        params.require(:bookmark).permit(:video_id)
      end
    end
  end
end
