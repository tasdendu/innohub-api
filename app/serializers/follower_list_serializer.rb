# frozen_string_literal: true

class FollowerListSerializer < ApplicationSerializer
  attributes(
    :user_id,
    :club_id
  )

  attribute :club do |object, params|
    ClubListSerializer.new(object.club, params:)
  end
end
