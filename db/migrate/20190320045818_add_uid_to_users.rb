# frozen_string_literal: true

# Adds GitHub UID to users table
class AddUidToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uid, :string
  end
end
