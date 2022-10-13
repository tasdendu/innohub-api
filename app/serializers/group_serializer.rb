# frozen_string_literal: true

class GroupSerializer < ApplicationSerializer
  attributes :name, :description, :private, :followers_count

  belongs_to :user, serializer: UserListSerializer
  has_many :photos
end
