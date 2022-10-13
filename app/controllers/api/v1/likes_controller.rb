# frozen_string_literal: true

module Api
  module V1
    class LikesController < ApplicationController
      def index
        render_paginated_collection(
          (parent.respond_to?(:likes) ? parent.likes : Like).includes(
            :likeable,
            user: %i[profile roles]
          ),
          LikeListSerializer
        )
      end

      def show
        show_like_form(like_form)
      end

      def create
        create_like_form(like_form)
      end

      def destroy
        destroy_like_form(like_form)
      end

      private

      def like_form
        LikeForm.new(
          current_user:,
          parent:,
          id: params[:id],
          include: %i[likeable user]
        )
      end
    end
  end
end
