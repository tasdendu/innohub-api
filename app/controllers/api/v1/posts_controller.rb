# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApplicationController
      before_action :assign_params, only: %i[create update]

      # GET /posts
      def index
        populate = PostPopulator.new(current_user:, parent:, params: query_params)
        render_paginated_collection(populate.run)
      end

      # GET /posts/1
      def show
        show_post_form(post_form)
      end

      # POST /posts
      def create
        create_post_form(post_form)
      end

      # PATCH/PUT /posts/1
      def update
        update_post_form(post_form)
      end

      # DELETE /posts/1
      def destroy
        destroy_post_form(post_form)
      end

      private

      # Only allow a list of trusted parameters through.
      def post_params
        params.require(:post).permit(
          :title, :body, :kind, :enabled, tag_list: [], category_ids: [], photos_attributes: %i[id image _destroy]
        )
      end

      def post_form
        PostForm.new(
          post_attributes
        )
      end

      def post_attributes
        @post_attributes ||= {
          id: params[:id],
          current_user:,
          parent:,
          include: [:photos]
        }
      end

      def assign_params
        post_attributes.merge!(params: post_params)
      end

      def query_params
        params.permit(:q, :kind, category_ids: [])
      end
    end
  end
end
