class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :body
      t.integer :kind
      t.boolean :enabled
      t.bigint :likes_count
      t.bigint :comments_count
      t.bigint :suggestions_count

      t.timestamps
    end
  end
end
