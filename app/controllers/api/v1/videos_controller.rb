# frozen_string_literal: true

module Api
  module V1
    class VideosController < ApplicationController
      include ActiveStorage::Streaming
      # include ActiveStorage::SetBlob

      before_action :assign_params, only: %i[create update]
      skip_before_action :authenticate_user!

      def create
        create_video_form(video_form)
      end

      def update
        update_video_form(video_form)
      end

      def show
        http_cache_forever(public: true) do
          send_blob_stream video_form.send(:video).clip, disposition: params[:disposition]
        end
      end

      def destroy
        destroy_video_form(video_form)
      end

      private

      def video_params
        params.require(:video).permit(:clip)
      end

      def video_form
        VideoForm.new(video_attributes)
      end

      def video_attributes
        @video_attributes ||= {
          current_user:,
          id: params[:id],
          parent:
        }
      end

      def assign_params
        video_attributes.merge!(params: video_params)
      end
    end
  end
end
