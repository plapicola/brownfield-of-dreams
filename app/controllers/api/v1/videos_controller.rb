# frozen_string_literal: true

module Api
  module V1
    # Controls API V1 video endpoints for non-authenticated users
    class VideosController < ApplicationController
      def show
        render json: Video.find(params[:id])
      end
    end
  end
end
