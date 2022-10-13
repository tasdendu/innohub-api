# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user { nil }
    commentable { nil }
    parent_id { '' }
    type { '' }
    body { 'MyString' }
  end
end
