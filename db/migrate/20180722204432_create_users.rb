# frozen_string_literal: true

# Migration to create users table through ActiveRecord
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :email, index: true
      t.string  :first_name
      t.string  :last_name
      t.string  :password_digest
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
