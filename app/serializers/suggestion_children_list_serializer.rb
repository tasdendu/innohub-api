# frozen_string_literal: true

class SuggestionChildrenListSerializer < ApplicationSerializer
  attributes(
    :body,
    :parent_id,
    :suggestable_id,
    :suggestable_type,
    :user_id,
    :suggested_at
  )

  attribute :user do |object|
    UserListSerializer.new(object.user)
  end
end