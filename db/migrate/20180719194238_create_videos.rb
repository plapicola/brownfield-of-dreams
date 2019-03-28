# frozen_string_literal: true

# Migration to create videos table through ActiveRecord
class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :video_id
      t.string :thumbnail
    end
  end
end
