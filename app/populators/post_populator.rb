# frozen_string_literal: true

class PostPopulator < BasePopulator
  attr_accessor :kind, :category_ids, :user_id

  KIND = %w[idea petition question poll].freeze

  def run
    posts
      .then { |posts| filter_by_kind(posts) }
      .then { |posts| filter_by_category(posts) }
      .then { |posts| filter_by_user(posts) }
      .public_send(:search, q)
  end

  private

  def posts
    @posts ||= (parent ? parent.posts : Post).includes(:comments, :likes, :suggestions)
  end

  def filter_by_kind(posts)
    return posts if kind.blank?

    posts.where(kind: fetch_kind)
  end

  def filter_by_category(posts)
    return posts if category_ids.blank?

    posts.joins(:categories).where(categories: { id: category_ids }).distinct
  end

  def filter_by_user(posts)
    return posts if user_id.blank?

    posts.where(user_id:)
  end

  def fetch_kind
    kind.presence_in(KIND) || :idea
  end
end
