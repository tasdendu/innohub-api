# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
