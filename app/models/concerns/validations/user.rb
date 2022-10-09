# frozen_string_literal: true

module Validations
  module User
    extend ActiveSupport::Concern

    included do
      validates :email, :roles, presence: true
      validates :email, :username, :phone, uniqueness: { allow_blank: true }
    end
  end
end
