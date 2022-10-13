# frozen_string_literal: true

module Relations
  module Post
    extend ActiveSupport::Concern

    included do
      belongs_to :user, inverse_of: :posts

      has_many :photos, as: :imageable, dependent: :destroy
      has_many :post_categories, dependent: :destroy
      has_many :categories, through: :post_categories
      has_many :likes, as: :likeable, dependent: :destroy
      has_many :comments, as: :commentable, dependent: :destroy
      has_many :suggestions, as: :suggestable, dependent: :destroy

      accepts_nested_attributes_for(:photos, allow_destroy: true)
    end
  end
end
