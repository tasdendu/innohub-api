# frozen_string_literal: true

class FollowerListSerializer < ApplicationSerializer
  attributes(
    :user_id,
    :followable_id,
    :followable_type
  )

  attribute :user do |object, params|
    UserListSerializer.new(object.user, params:)
  end
end
