# frozen_string_literal: true

class Suggestion < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :suggestable, polymorphic: true
  belongs_to :parent, class_name: 'Suggestion', optional: true, inverse_of: :children, counter_cache: true

  has_many :children, class_name: 'Suggestion', foreign_key: :parent_id, inverse_of: :parent, dependent: :nullify
  has_many :likes, as: :likeable, dependent: :destroy

  def suggested_at
    time_ago_in_words(created_at, include_seconds: true)
  end
end
