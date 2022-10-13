# frozen_string_literal: true

class PostPopulator < BasePopulator
  attr_accessor :kind

  KIND = %w[idea petition question poll].freeze

  def run
    posts
      .send { |posts| filter_by_kind(posts) }
      .public_send(:search, q)
  end

  private

  def posts
    Post.includes(:comments, :likes, :suggestions)
  end

  def filter_by_kind(posts)
    return posts if kind.blank?

    posts.where(kind: fetch_kind)
  end

  def fetch_kind
    KIND.presence_in(kind) || :idea
  end
end
