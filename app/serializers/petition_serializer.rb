# frozen_string_literal: true

class PetitionSerializer < ApplicationSerializer
  attributes :user_id, :post_id

  belongs_to :user, serializer: UserListSerializer
end
