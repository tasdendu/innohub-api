class AddPetitionsCountToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :petitions_count, :bigint
  end
end
