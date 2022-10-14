# frozen_string_literal: true

class PostJob
  include Sidekiq::Job

  def perform(id)
    post = Post.find(id)
    ActionCable.server.broadcast(
      'post',
      PostSerializer.new(post, params: { current_user: post.user }).serializable_hash.to_json
    )
  end
end
