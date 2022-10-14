# frozen_string_literal: true

module Api
  module V1
    class ReportsController < ApplicationController
      before_action :set_report, only: %i[show update destroy]

      # GET /reports
      def index
        render_paginated_collection(parent.reports)
      end

      # POST /reports
      def create
        create_report_form(report_form)
      end

      private

      def report_form
        ReportForm.new(
          parent:,
          current_user:
        )
      end
    end
  end
end
