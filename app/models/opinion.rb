# frozen_string_literal: true

class Opinion < ApplicationRecord
  belongs_to :option, inverse_of: :opinions, counter_cache: true
  belongs_to :user

  delegate(:text, to: :option, prefix: true)
end
