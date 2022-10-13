class CreateFollowings < ActiveRecord::Migration[7.0]
  def change
    create_table :followings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :followingable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
