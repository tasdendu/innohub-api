# frozen_string_literal: true

class SettingCategory < ApplicationRecord
  belongs_to :setting
  belongs_to :category
end
