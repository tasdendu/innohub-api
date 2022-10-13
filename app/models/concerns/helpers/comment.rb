# frozen_string_literal: true

module Helpers
  module Comment
    extend ActiveSupport::Concern

    def commented_at
      time_ago_in_words(created_at, include_seconds: true)
    end
  end
end
