# frozen_string_literal: true

module Validations
  module Role
    extend ActiveSupport::Concern

    included do
      validates :name, uniqueness: { case_sensitive: false }
    end
  end
end
