# frozen_string_literal: true

module Relations
  module Role
    extend ActiveSupport::Concern

    included do
      has_many :user_roles, dependent: :destroy, inverse_of: :roles
      has_many :users, through: :user_roles
    end
  end
end
