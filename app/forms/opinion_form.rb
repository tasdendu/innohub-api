# frozen_string_literal: true

class OpinionForm < BaseForm
  def show
    opinion
  end

  def create
    opinion.save.tap do |res|
      res && create_notification(notification_attribute)
    end
  end

  delegate :destroy, to: :opinion

  private

  def opinion
    @opinion ||= id ? Opinion.find(id) : parent.opinions.find_or_initialize_by(user_id: current_user.id)
  end

  def notification_attribute
    {
      title: opinion.user.profile_photo_url,
      text: "<strong>#{opinion.user.name}</strong> has selected <strong>#{opinion.option.text}" \
            '</strong>',
      path: "/posts/#{opinion.option.post_id}",
      recipient_ids: [opinion.option.post.user_id]
    }
  end
end
