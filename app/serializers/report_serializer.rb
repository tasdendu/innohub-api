# frozen_string_literal: true

class ReportSerializer < ApplicationSerializer
  attributes :user_id, :post_id

  attribute :user do |obj, params|
    UserListSerializer.new(obj.user, params:)
  end
end
