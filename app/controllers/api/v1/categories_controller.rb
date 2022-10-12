# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :assign_params, only: %i[create update]

      # GET /categories
      def index
        render_paginated_collection(Category.all)
      end

      # GET /categories/1
      def show
        show_category_form(category_form)
      end

      # POST /categories
      def create
        create_category_form(category_form)
      end

      # PATCH/PUT /categories/1
      def update
        update_category_form(category_form)
      end

      # DELETE /categories/1
      def destroy
        destroy_category_form(category_form)
      end

      private

      # Only allow a list of trusted parameters through.
      def category_params
        params.require(:category).permit(:name, :description, :image)
      end

      def category_form
        CategoryForm.new(
          category_attributes
        )
      end

      def category_attributes
        @category_attributes ||= {
          id: params[:id]
        }
      end

      def assign_params
        category_attributes.merge!(params: category_params)
      end
    end
  end
end
