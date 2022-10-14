class AddReportsCountToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :reports_count, :bigint
  end
end
