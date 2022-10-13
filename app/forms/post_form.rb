# frozen_string_literal: true

class PostForm < BaseForm
  def show
    post
  end

  def create
    post.save.tap do |res|
      res && create_notification(notification_attribute)
    end
  end

  def update
    post.update(params)
  end

  delegate :destroy, to: :post

  private

  def post
    @post ||= id ? Post.find(id) : build_post_form
  end

  def build_post_form
    parent ? parent.posts.build(params.merge!(user: current_user)) : current_user.posts.build(params)
  end

  def notification_attribute
    {
      title: post.title,
      text: "<strong>#{post.user.name}</strong> has posted <strong>#{post.title}</strong>",
      path: "/posts/#{post.id}",
      recipient_ids: [post.user_id]
    }
  end
end
