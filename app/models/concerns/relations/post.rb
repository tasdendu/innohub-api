# frozen_string_literal: true

module Relations
  module Post
    extend ActiveSupport::Concern

    included do
      belongs_to :user, inverse_of: :posts, counter_cache: true
      belongs_to :postable, polymorphic: true, optional: true, counter_cache: :posts_count

      has_many :photos, as: :imageable, dependent: :destroy
      has_many :post_categories, dependent: :destroy
      has_many :categories, through: :post_categories
      has_many :likes, as: :likeable, dependent: :destroy
      has_many :comments, as: :commentable, dependent: :destroy
      has_many :suggestions, as: :suggestable, dependent: :destroy
      has_many :options, inverse_of: :post, dependent: :destroy
      has_many :petitions, inverse_of: :post, dependent: :destroy

      accepts_nested_attributes_for(:photos, :options, allow_destroy: true)
    end
  end
end
