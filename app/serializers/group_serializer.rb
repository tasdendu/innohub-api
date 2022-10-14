# frozen_string_literal: true

class GroupSerializer < ApplicationSerializer
  attributes :name, :description, :private, :followers_count

  attribute :photos do |obj, params|
    PhotoSerializer.new(obj, params:)
  end
  belongs_to :user, serializer: UserListSerializer
end
