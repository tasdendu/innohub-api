# frozen_string_literal: true

module Scopes
  module Post
    extend ActiveSupport::Concern

    included do
      default_scope -> { order(created_at: :desc) }
      scope :search, lambda { |query|
        joins(:tags, :categories).where(
          "CONCAT_WS(' ', title, body, tags.name, categories.name) iLIKE ?", "%#{query&.squish}%"
        ).distinct
      }
    end
  end
end
