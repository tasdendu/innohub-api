# frozen_string_literal: true

module Validations
  module Notification
    extend ActiveSupport::Concern

    included do
      validates :title, :text, :recipients, presence: true
    end
  end
end
