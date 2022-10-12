# frozen_string_literal: true

class Category < ApplicationRecord
  has_one_attached :image

  def image_url
    image.url if image.attached?
  end
end
