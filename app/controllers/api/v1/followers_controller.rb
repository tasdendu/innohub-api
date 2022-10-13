# frozen_string_literal: true

module Api
  module V1
    class FollowersController < ApplicationController
      before_action :assign_params, only: :create

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

      def follower_params
        params.require(:follower).permit(:user_id)
      end

      def follower_form
        FollowerForm.new(
          following_attributes
        )
      end

      def following_attributes
        @following_attributes ||= {
          current_user:,
          parent:,
          id: params[:id],
          include: %i[followable user]
        }
      end

      def assign_params
        following_attributes.merge!(params: follower_params)
      end
    end
  end
end
