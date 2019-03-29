# frozen_string_literal: true

# User model for Database table User
class User < ApplicationRecord
  has_many :user_videos
  has_many :videos, through: :user_videos
  has_many :friends
  has_many :friend_users, through: :friends

  validates :email,
            uniqueness: true,
            presence: true,
            length: {
              minimum: 1
            }
  validates :first_name,
            presence: true,
            length: {
              minimum: 1
            }
  validates :last_name,
            presence: true,
            length: {
              minimum: 1
            }
  validates :password,
            confirmation: true
  has_secure_password

  enum role: %i[default admin]

  def self.bookmarked_videos(user)
    Video.joins(:user_videos, :tutorial)
         .where(user_videos: { user_id: user })
         .order('tutorials.id ASC, videos.position ASC')
  end

  def self.pending_requests(user)
    User.joins('JOIN friends a ON a.user_id = users.id')
        .joins("LEFT OUTER JOIN friends b ON a.friend_user_id = b.user_id
                AND a.user_id = b.friend_user_id")
        .where('a.friend_user_id = ?', user.id)
        .where('b.id IS NULL')
  end
end
