# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      before_action :assign_params, only: %i[create update]

      def index
        render_paginated_collection(
          (parent.respond_to?(:comments) ? parent.comments : Comment).where(parent_id: nil).includes(
            :children,
            commentable: :photo,
            user: %i[profile roles]
          ),
          serializer: CommentListSerializer
        )
      end

      def show
        show_comment_form(comment_form)
      end

      def create
        create_comment_form(comment_form)
      end

      def update
        update_comment_form(comment_form)
      end

      def destroy
        destroy_comment_form(comment_form)
      end

      private

      def comment_params
        params.require(:comment).permit(
          :body,
          :parent_id
        )
      end

      def comment_form
        CommentForm.new(
          comment_attributes
        )
      end

      def comment_attributes
        @comment_attributes ||= {
          current_user:,
          parent:,
          id: params[:id],
          include: %i[commentable user children]
        }
      end

      def assign_params
        comment_attributes.merge!(params: comment_params)
      end
    end
  end
end
