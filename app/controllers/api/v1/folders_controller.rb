# frozen_string_literal: true

module Api
  module V1
    class FoldersController < ApplicationController
      before_action :set_folder, only: %i[show update destroy]

      # GET /api/v1/folders
      def index
        render json: {
          status: :ok,
          data: Folder.all
        }
      end

      # GET /api/v1/folders/:id
      def show
        render json: {
          status: :ok,
          data: @folder
        }
      end

      # POST /api/v1/folders
      def create
        folder = Folder.new(folder_params)
        folder.user = User.first

        if folder.save
          render json: {
            status: :ok,
            data: folder
          }
        else
          render json: {
            status: :unprocessable_entity,
            errors: folder.errors.full_messages
          }
        end
      end

      # PATCH/PUT /api/v1/folders/:id
      def update
        if @folder.update(folder_params)
          render json: {
            status: :ok,
            data: @folder
          }
        else
          render json: {
            status: :unprocessable_entity,
            errors: @folder.errors.full_messages
          }
        end
      end

      # DELETE /api/v1/folders/:id
      def destroy
        @folder.destroy
        render json: {
          status: :ok
        }
      end

      private

      def set_folder
        @folder = Folder.find(params[:id])
      end

      def folder_params
        params.require(:folder).permit(:name)
      end
    end
  end
end
