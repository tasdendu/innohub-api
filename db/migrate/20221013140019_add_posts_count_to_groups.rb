class AddPostsCountToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :posts_count, :bigint
  end
end
