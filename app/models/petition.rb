# frozen_string_literal: true

class Petition < ApplicationRecord
  belongs_to :user
  belongs_to :post, inverse_of: :petitions, counter_cache: true
end
