# frozen_string_literal: true

class AttachmentForm < BaseForm
  def create
    attachment.save
  end

  def update
    attachment.update(params)
  end

  delegate :destroy, to: :attachment

  private

  def attachment
    @attachment ||= id ? Attachment.find(id) : determine_singularity
  end

  def determine_singularity
    parent.respond_to?(:attachment) ? parent.build_attachment(params) : parent.attachments.build(params)
  end
end
