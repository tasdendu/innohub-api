# frozen_string_literal: true

class KindWisePostPopulator < BasePopulator
  def run
    kind_wise_posts
  end

  private

  def posts
    @posts ||= Post.includes(:photos, :options)
  end

  def kind_wise_posts
    lists = []
    grouped_posts = posts.includes(user: :profile).group_by { |p| p.user.state }
    grouped_posts.each do |key, values|
      kind_posts = values.group_by(&:kind)
      lists << Struct.new(:id, :dzongkhag, :kind_posts).new(
        key, key,
        kind_posts.map { |p, v| { kind: p, count: v.size } }
      )
    end
    lists
  end
end
