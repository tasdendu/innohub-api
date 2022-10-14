# frozen_string_literal: true

module Api
  module V1
    class GroupsController < ApplicationController
      before_action :assign_params, only: %i[create update]
      skip_before_action :authenticate_user!, only: :index

      # GET /groups
      def index
        populate = GroupPopulator.new(current_user:, params: query_params)
        render_paginated_collection(populate.run)
      end

      # GET /groups/1
      def show
        show_group_form(group_form)
      end

      # POST /groups
      def create
        create_group_form(group_form)
      end

      # PATCH/PUT /groups/1
      def update
        update_group_form(group_form)
      end

      # DELETE /groups/1
      def destroy
        destroy_group_form(group_form)
      end

      private

      # Only allow a list of trusted parameters through.
      def group_params
        params.require(:group).permit(
          :name, :description, :private, photos_attributes: %i[id image _destroy]
        )
      end

      def group_form
        GroupForm.new(
          group_attributes
        )
      end

      def group_attributes
        @group_attributes ||= {
          id: params[:id],
          current_user:,
          include: %i[user]
        }
      end

      def assign_params
        group_attributes.merge!(params: group_params)
      end

      def query_params
        params.permit(:q)
      end
    end
  end
end
