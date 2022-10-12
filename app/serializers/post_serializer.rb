# frozen_string_literal: true

class PostSerializer < ApplicationSerializer
  attributes :title, :body, :kind, :enabled, :tag_list

  has_many :photos
end
