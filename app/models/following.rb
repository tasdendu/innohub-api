# frozen_string_literal: true

class Following < ApplicationRecord
  belongs_to :user
  belongs_to :followingable, polymorphic: true, counter_cache: true
end
