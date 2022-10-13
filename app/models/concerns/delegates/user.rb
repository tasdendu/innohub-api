# frozen_string_literal: true

module Delegates
  module User
    extend ActiveSupport::Concern

    included do
      delegate(:name, :country, :state, :about, to: :profile, allow_nil: true)
    end
  end
end
