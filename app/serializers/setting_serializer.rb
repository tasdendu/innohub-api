# frozen_string_literal: true

class SettingSerializer < ApplicationSerializer
  attributes :meta

  attribute :categories do |obj|
    CategorySerializer.new(obj.categories)
  end
end
