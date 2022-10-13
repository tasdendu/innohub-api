# frozen_string_literal: true

module Api
  module V1
    class FollowingsController < ApplicationController
      def index
        render_paginated_collection(
          (parent.respond_to?(:followings) ? parent.followings : Following).includes(
            :followingable,
            user: %i[profile roles]
          ),
          serializer: FollowingListSerializer
        )
      end

      def show
        show_following_form(following_form)
      end

      def create
        create_following_form(following_form)
      end

      def destroy
        destroy_following_form(following_form)
      end

      private

      def following_form
        FollowingForm.new(
          current_user:,
          parent:,
          id: params[:id],
          include: %i[followingable user]
        )
      end
    end
  end
end
