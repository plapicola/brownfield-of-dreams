# frozen_string_literal: true

# Serializes tutorial information for API returns
class TutorialSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :thumbnail, :videos

  def videos
    object.videos
  end
end
