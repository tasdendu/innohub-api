# frozen_string_literal: true

class DashboardPopulator < BasePopulator
  def run
    stats
  end

  private

  def stats
    posts ||= Post.includes(:photos, :options)
    Struct.new(:id, :idea, :petition, :question, :poll).new(
      posts.first&.id,
      posts.count(&:idea?),
      posts.count(&:petition?),
      posts.count(&:question?),
      posts.count(&:poll?)
    )
  end
end
