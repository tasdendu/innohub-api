# frozen_string_literal: true

class PostForm < BaseForm
  def show
    post
  end

  def create
    post.save
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
end
