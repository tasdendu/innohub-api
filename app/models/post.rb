# frozen_string_literal: true

class Post < ApplicationRecord
  include Scopes::Post
  include Relations::Post

  acts_as_taggable_on :tags

  enum kind: { idea: 0, petition: 1, question: 2, poll: 3 }

  validates :title, :kind, :categories, presence: true
end
