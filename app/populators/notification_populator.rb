# frozen_string_literal: true

class NotificationPopulator < BasePopulator
  def run
    ntf = notifications
          .public_send(:search, q)
    [ntf, unread_notification_count(ntf)]
  end

  private

  def notifications
    @notifications ||= current_user.notifications.includes(:rich_text_text, :recipients)
  end

  def unread_notification_count(ntf)
    {
      unread_notification: ntf.count { |n| !n.recipients.find { |x| x.user_id == current_user.id }&.read }
    }
  end
end
