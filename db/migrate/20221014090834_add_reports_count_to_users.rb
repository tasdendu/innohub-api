class AddReportsCountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :reports_count, :bigint
  end
end
