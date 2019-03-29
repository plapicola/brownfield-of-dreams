# frozen_string_literal: true

# Formats output of UserVideo information for JSON API
class UserVideoSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :video_id
end
