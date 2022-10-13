# frozen_string_literal: true

module Scopes
  module Comment
    extend ActiveSupport::Concern

    included do
      default_scope -> { order(created_at: :asc) }
    end
  end
end
