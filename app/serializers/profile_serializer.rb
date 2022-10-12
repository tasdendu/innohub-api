# frozen_string_literal: true

class ProfileSerializer
  include JSONAPI::Serializer
  attributes :name, :country, :state, :about, :social_links
end
