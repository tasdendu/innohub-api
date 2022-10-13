# frozen_string_literal: true

module Api
  module V1
    class PetitionsController < ApplicationController
      # GET /petitions
      def index
        render_paginated_collection(parent.petitions)
      end

      # POST /petitions
      def create
        create_petition_form(petition_form)
      end

      # DELETE /petitions/1
      def destroy
        destroy_petition_form(petition_form)
      end

      private

      def petition_form
        PetitionForm.new(
          current_user:,
          parent:,
          id: params[:id],
          include: [:user]
        )
      end
    end
  end
end
