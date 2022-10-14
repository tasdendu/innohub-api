# frozen_string_literal: true

class PetitionForm < BaseForm
  def create
    petition.save.tap do |res|
      res && create_notification(notification_attribute)
    end
  end

  delegate :destroy, to: :petition

  private

  def petition
    @petition ||= id ? Petition.find(id) : parent.petitions.find_or_initialize_by(user_id: current_user.id)
  end

  def notification_attribute
    {
      title: petition.user.profile_photo_url,
      text: "<strong>#{petition.user.name}</strong> has supported your petition <strong>#{petition.post.title}" \
            '</strong>',
      path: "posts/#{petition.post_id}",
      recipient_ids: [petition.post.user_id]
    }
  end
end
