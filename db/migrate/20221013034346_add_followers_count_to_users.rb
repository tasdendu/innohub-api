class AddFollowersCountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :followers_count, :bigint
    add_column :users, :comments_count, :bigint
    add_column :users, :likes_count, :bigint
    add_column :users, :suggestions_count, :bigint
  end
end
