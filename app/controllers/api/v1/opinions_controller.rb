# frozen_string_literal: true

module Api
  module V1
    class OpinionsController < ApplicationController
      def index
        render_paginated_collection(parent.opinions)
      end

      def show
        show_opinion_form(opinion_form)
      end

      def create
        create_opinion_form(opinion_form)
      end

      def destroy
        destroy_opinion_form(opinion_form)
      end

      private

      def opinion_form
        OpinionForm.new(
          current_user:,
          parent:,
          id: params[:id],
          include: %i[user]
        )
      end
    end
  end
end
