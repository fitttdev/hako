# frozen_string_literal: true

module Api
  module V1
    class RootsController < ApplicationController
      # GET /api/v1/root
      def show
        root = Folder.find_by(user_id: current_user.id)

        if root.nil?
          root = Folder.create(
            user: current_user,
            name: "#{current_user.id}-root",
            root: true
          )
        end

        render json: {
          status: :ok,
          data: root
        }
      end
    end
  end
end
