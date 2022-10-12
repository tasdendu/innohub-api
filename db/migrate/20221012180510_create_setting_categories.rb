class CreateSettingCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :setting_categories do |t|
      t.references :setting, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
