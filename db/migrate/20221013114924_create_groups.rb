class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.boolean :private, default: false
      t.bigint :followers_count

      t.timestamps
    end
  end
end
