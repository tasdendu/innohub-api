# frozen_string_literal: true

module Callbacks
  module User
    extend ActiveSupport::Concern

    included do
      before_validation :assign_default
    end

    def assign_default
      self.role_ids = role_ids.presence || [2]
    end
  end
end
