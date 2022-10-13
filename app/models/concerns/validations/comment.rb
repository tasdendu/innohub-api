# frozen_string_literal: true

module Validations
  module Comment
    extend ActiveSupport::Concern

    included do
      validates :body, presence: true
    end
  end
end
