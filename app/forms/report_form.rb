# frozen_string_literal: true

class ReportForm < BaseForm
  def create
    report.save.tap do |res|
      res && create_notification(notification_attribute)
    end
  end

  private

  def report
    @report ||= parent.reports.find_or_initialize_by(user_id: current_user.id)
  end

  def notification_attribute
    {
      title: report.user.profile_photo_url,
      text: "<strong>#{report.user.name}</strong> has reported a post <strong>#{report.post.title}" \
            '</strong>',
      path: "/posts/#{report.post_id}",
      recipient_ids: User.select(&:admin?).pluck(:id)
    }
  end
end
