class AddCommentsCountToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :comments_count, :bigint
  end
end
