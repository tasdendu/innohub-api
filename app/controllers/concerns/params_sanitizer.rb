# frozen_string_literal: true

module ParamsSanitizer
  def user_attributes # rubocop:disable Metrics/MethodLength
    [
      :id,
      :email,
      :phone,
      :username,
      :current_password,
      :active,
      { role_ids: [] },
      { setting_attributes: [
          meta: %i[key value], category_ids: []
        ],
        profile_attributes: [:name, :country, :state, :about, { social_links: [] }],
        profile_photo_attributes: %i[id image _destroy],
        cover_photo_attributes: %i[id image _destroy] }
    ]
  end
end
