# frozen_string_literal: true

class CategoryWisePostPopulator < BasePopulator
  attr_accessor :category_id

  def run
    raise ActiveRecord::RecordNotFound, 'Category required' if category_id.blank?

    category_wise_posts
  end

  private

  def posts
    @posts ||= Post.includes(:options, :photos).joins(:categories).where(categories: { id: category_id }).distinct
  end

  def category_wise_posts
    posts.group_by { |p| p.user.state }.map do |p, v|
      Struct.new(:id, :key, :value).new(p, p, v.size)
    end
  end
end
