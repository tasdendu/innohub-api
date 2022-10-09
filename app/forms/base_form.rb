# frozen_string_literal: true

class BaseForm
  include Assigner
  include Pundit::Authorization
  include Rails.application.routes.url_helpers

  attr_accessor(
    :current_user,
    :include,
    :parent,
    :params,
    :id
  )

  def initialize(attributes = {})
    assign_attributes(attributes)
  end

  def determine_boolean(status)
    [true, 'true'].include?(status)
  end

  def create_notification(attr = { title: nil, text: '', path: '', recipient_ids: [] })
    Notification.create(
      title: attr[:title],
      text: attr[:text],
      url: root_url.concat(attr[:path]),
      user_ids: attr[:recipient_ids]
    )
  end
end
