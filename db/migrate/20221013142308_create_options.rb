class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.references :post, null: false, foreign_key: true
      t.string :text

      t.timestamps
    end
  end
end
