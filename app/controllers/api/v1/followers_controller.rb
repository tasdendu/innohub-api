# frozen_string_literal: true

module Api
  module V1
    class FollowersController < ApplicationController
      def index
        render_paginated_collection(
          (parent.respond_to?(:followers) ? parent.followers : Follower).includes(
            :followable,
            user: %i[profile roles]
          ),
          serializer: FollowerListSerializer
        )
      end

      def show
        show_follower_form(follower_form)
      end

      def create
        create_follower_form(follower_form)
      end

      def destroy
        destroy_follower_form(follower_form)
      end

      private

      def follower_form
        followerForm.new(
          current_user:,
          parent:,
          id: params[:id],
          include: %i[followerable user]
        )
      end
    end
  end
end
