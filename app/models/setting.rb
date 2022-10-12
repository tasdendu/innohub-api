# frozen_string_literal: true

class Setting < ApplicationRecord
  belongs_to :user

  has_many :setting_categories, dependent: :destroy
  has_many :categories, through: :setting_categories
end
