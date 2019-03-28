# frozen_string_literal: true

# Adds reference to tutorials in videos table
class AddTutorialsToVideos < ActiveRecord::Migration[5.2]
  def change
    add_reference :videos, :tutorial, index: true
  end
end
