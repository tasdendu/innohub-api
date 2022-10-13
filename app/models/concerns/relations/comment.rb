# frozen_string_literal: true

module Relations
  module Comment
    extend ActiveSupport::Concern

    included do
      belongs_to :commentable, polymorphic: true, counter_cache: true
      belongs_to :user, counter_cache: true
      belongs_to :parent, class_name: 'Comment', optional: true, inverse_of: :children, counter_cache: true

      has_many :children, class_name: 'Comment', foreign_key: :parent_id, inverse_of: :parent, dependent: :nullify
      has_many :likes, as: :likeable, dependent: :destroy
    end
  end
end
