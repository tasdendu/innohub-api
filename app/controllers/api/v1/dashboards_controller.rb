# frozen_string_literal: true

module Api
  module V1
    class DashboardsController < ApplicationController
      def index
        populate = DashboardPopulator.new(current_user:, params: query_params)
        render json: DashboardSerializer.new(populate.run)
      end

      def kind
        populate = KindWisePostPopulator.new(current_user:, params: query_params)
        render_paginated_collection(populate.run, serializer: KindWisePostSerializer)
      end

      def category
        populate = CategoryWisePostPopulator.new(current_user:, params: query_params)
        render_paginated_collection(populate.run, serializer: CategoryWisePostSerializer)
      end

      def user
        populate = StateWiseUserPopulator.new(current_user:, params: query_params)
        render_paginated_collection(populate.run, serializer: StateWiseUserSerializer)
      end

      private

      def query_params
        params.permit(:q, :state, :category_id)
      end
    end
  end
end
