# frozen_string_literal: true

class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :friend_user, class_name: 'User'
end
