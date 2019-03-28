# frozen_string_literal: true

class Tutorial < ApplicationRecord
  has_many :videos, -> { order(position: :ASC) }, dependent: :destroy
  acts_as_taggable_on :tags, :tag_list
  accepts_nested_attributes_for :videos

  scope :public_tutorials, -> { where(classroom: false) }

  validates :title,
            presence: true,
            length: {
              minimum: 1
            }

  validates :description,
            presence: true,
            length: {
              minimum: 1
            }

  validates :thumbnail, url: true
end
