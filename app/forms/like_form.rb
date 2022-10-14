# frozen_string_literal: true

class LikeForm < BaseForm
  def show
    like
  end

  def create
    like.save.tap do |res|
      res && create_notification(notification_attribute)
    end
  end

  delegate :destroy, to: :like

  private

  def like
    @like ||= id ? Like.find(id) : parent.likes.find_or_initialize_by(user: current_user)
  end

  def notification_attribute # rubocop:disable Metrics/AbcSize
    {
      title: like.user.profile_photo_url,
      text: "<strong>#{like.user.name}</strong> has liked your #{like.likeable_type.downcase} <strong>" \
            "'#{like.likeable.try(:title) || like.likeable.try(:body)}'</strong>",
      path: "#{like.likeable_type.downcase.pluralize}/#{like.likeable_id}",
      recipient_ids: [like.likeable.user_id]
    }
  end
end
