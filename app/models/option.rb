# frozen_string_literal: true

class Option < ApplicationRecord
  belongs_to :post

  has_many :opinions, inverse_of: :option, dependent: :destroy
end
