class CreateSuggestions < ActiveRecord::Migration[7.0]
  def change
    create_table :suggestions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :suggestable, polymorphic: true, null: false
      t.text :body
      t.bigint :parent_id
      t.string :type
      t.bigint :suggestions_count

      t.timestamps
    end
  end
end
