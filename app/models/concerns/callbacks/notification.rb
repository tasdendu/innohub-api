# frozen_string_literal: true

module Callbacks
  module Notification
    extend ActiveSupport::Concern

    included do
      after_create :broadcast_notification
    end

    def broadcast_notification
      users.each do |user|
        ActionCable.server.broadcast(
          "notification_#{user.id}",
          NotificationSerializer.new(self, params: { current_user: user }).serializable_hash.to_json
        )
      end
    end
  end
end
