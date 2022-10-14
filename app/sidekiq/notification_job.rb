# frozen_string_literal: true

class NotificationJob
  include Sidekiq::Job

  def perform(id)
    notification = Notification.find(id)
    notification.users.each do |user|
      ActionCable.server.broadcast(
        "notification_#{user.id}",
        NotificationSerializer.new(notification, params: { current_user: user }).serializable_hash.to_json
      )
    end
  end
end
