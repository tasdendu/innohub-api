# frozen_string_literal: true

module Relations
  module User
    extend ActiveSupport::Concern

    included do
      has_many :recipients, inverse_of: :user, dependent: :destroy
      has_many :notifications, through: :recipients
      has_many :user_roles, dependent: :destroy, inverse_of: :user
      has_many :roles, through: :user_roles
    end
  end
end
