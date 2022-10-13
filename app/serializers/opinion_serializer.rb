# frozen_string_literal: true

class OpinionSerializer < ApplicationSerializer
  attributes(:user_id, :option_id, :option_text)

  belongs_to :user, serializer: UserListSerializer
end
