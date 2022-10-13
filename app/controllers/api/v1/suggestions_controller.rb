# frozen_string_literal: true

module Api
  module V1
    class SuggestionsController < ApplicationController
      before_action :assign_params, only: %i[create update]

      def index
        render_paginated_collection(
          (parent.respond_to?(:suggestions) ? parent.suggestions : Suggestion).where(parent_id: nil).includes(
            :children,
            suggestable: :photo,
            user: %i[profile roles]
          ),
          serializer: SuggestionListSerializer
        )
      end

      def show
        show_suggestion_form(suggestion_form)
      end

      def create
        create_suggestion_form(suggestion_form)
      end

      def update
        update_suggestion_form(suggestion_form)
      end

      def destroy
        destroy_suggestion_form(suggestion_form)
      end

      private

      # Only allow a list of trusted parameters through.
      def suggestion_params
        params.require(:suggestion).permit(:user_id, :body, :parent_id)
      end

      def suggestion_form
        SuggestionForm.new(
          suggestion_attributes
        )
      end

      def suggestion_attributes
        @suggestion_attributes ||= {
          current_user:,
          parent:,
          id: params[:id],
          include: %i[suggestable user children]
        }
      end

      def assign_params
        suggestion_attributes.merge!(params: suggestion_params)
      end
    end
  end
end
