# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :post, inverse_of: :reports, counter_cache: true
  belongs_to :user, inverse_of: :reports, counter_cache: true
end
