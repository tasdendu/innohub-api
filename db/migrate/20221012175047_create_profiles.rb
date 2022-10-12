class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :country
      t.string :state
      t.text :about
      t.string :social_links, array: true, default: []
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
