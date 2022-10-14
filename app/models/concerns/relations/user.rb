# frozen_string_literal: true

module Relations
  module User
    extend ActiveSupport::Concern

    included do
      has_one :profile, dependent: :destroy
      has_one :setting, dependent: :destroy
      has_one :profile_photo, as: :imageable, dependent: :destroy
      has_one :cover_photo, as: :imageable, dependent: :destroy

      has_many :recipients, inverse_of: :user, dependent: :destroy
      has_many :notifications, through: :recipients
      has_many :user_roles, dependent: :destroy
      has_many :roles, through: :user_roles
      has_many :posts, inverse_of: :user, dependent: :destroy
      has_many :followers, as: :followable, dependent: :destroy
      has_many :followings, as: :followingable, dependent: :destroy
      has_many :groups, inverse_of: :user, dependent: :destroy
      has_many :reports, inverse_of: :user, dependent: :destroy

      accepts_nested_attributes_for(
        :profile, :setting, :profile_photo, :cover_photo,
        update_only: true
      )
    end
  end
end
