# frozen_string_literal: true

# Serializes output of video information for JSON response on API
class VideoSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :position
end
