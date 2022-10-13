# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :user, inverse_of: :groups

  has_many :followers, as: :followable, dependent: :destroy
  has_many :photos, as: :imageable, dependent: :destroy

  default_scope -> { order(created_at: :desc) }
  scope :search, lambda { |query|
    where(
      "CONCAT_WS(' ', name, description) iLIKE ?", "%#{query&.squish}%"
    )
  }

  accepts_nested_attributes_for(:photos, allow_destroy: true)
end
