# frozen_string_literal: true

class OpinionSerializer < ApplicationSerializer
  attributes(:user_id, :option_id, :option_text)

  attribute :given do |obj, params|
    obj.post.opinions.pluck(:user_id).include?(params[:current_user]&.id)
  end

  belongs_to :user, serializer: UserListSerializer
end
