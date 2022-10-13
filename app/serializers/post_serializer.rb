# frozen_string_literal: true

class PostSerializer < ApplicationSerializer
  attributes(
    :title, :body, :kind, :enabled, :comments_count, :likes_count, :suggestions_count, :tag_list
  )

  has_many :photos
  has_many :options
end
