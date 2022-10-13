# frozen_string_literal: true

class FollowingListSerializer < ApplicationSerializer
  attributes(
    :user_id,
    :followingable_id,
    :followingable_type
  )

  attribute :user do |object, params|
    UserListSerializer.new(object.user, params:)
  end
end
