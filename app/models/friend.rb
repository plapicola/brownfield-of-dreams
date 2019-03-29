# frozen_string_literal: true

# Model for Friends table in database
class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :friend_user, class_name: 'User'
end
