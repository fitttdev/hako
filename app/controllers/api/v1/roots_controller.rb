# frozen_string_literal: true

module Api
  module V1
    class RootsController < ApplicationController
      # GET /api/v1/root
      def show
        # NOTE: Since the root folder is created only once and then
        # consistently rendered thereafter, querying the database
        # each time is inefficient. Caching significantly reduces
        # response time. For instance, the initial request may take
        # around 297ms (due to database access), but subsequent
        # requests, served from the cache, typically range from
        # 24 to 30ms.
        root = Rails.cache.fetch("root_folder_#{current_user.id}") do
          Folder.find_by(user_id: current_user.id) || create_root_folder
        end

        render json: { status: :ok, data: root }
      end

      private

      def create_root_folder
        Folder.create!(
          user: current_user,
          name: "#{current_user.id}-root",
          root: true
        )
      end
    end
  end
end
