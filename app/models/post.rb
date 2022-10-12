# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user, inverse_of: :posts

  has_many :photos, as: :imageable, dependent: :destroy
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories

  enum kind: { idea: 0, petition: 1, question: 2, poll: 3 }

  acts_as_taggable_on :tags

  validates :title, :kind, :categories, presence: true

  default_scope -> { order(created_at: :desc) }

  accepts_nested_attributes_for(:photos, allow_destroy: true)
end
