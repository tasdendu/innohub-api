class AddLikesCountToSuggestions < ActiveRecord::Migration[7.0]
  def change
    add_column :suggestions, :likes_count, :bigint
  end
end
