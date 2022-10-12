# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    user { nil }
    title { 'MyString' }
    body { 'MyText' }
    kind { 1 }
    enabled { false }
    likes_count { '' }
    comments_count { '' }
    suggestions_count { '' }
  end
end
