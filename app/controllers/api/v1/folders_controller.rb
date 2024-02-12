# frozen_string_literal: true

module Api
  module V1
    class FoldersController < ApplicationController
      before_action :set_folder, only: %i[show update destroy]

      # GET /api/v1/folders
      def index
        render json: {
          status: :ok,
          message: '/api/v1/folders retrieved successfully',
          data: Folder.all
        }
      end

      # GET /api/v1/folders/:id
      def show
        render json: {
          status: :ok,
          message: 'Folder retrieved successfully',
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
            message: 'Folder created successfully',
            data: folder
          }
        else
          render json: {
            status: :unprocessable_entity,
            message: 'Failed to create folder',
            errors: folder.errors.full_messages
          }
        end
      end

      # PATCH/PUT /api/v1/folders/:id
      def update
        if @folder.update(folder_params)
          render json: {
            status: :ok,
            message: 'Folder updated successfully',
            data: @folder
          }
        else
          render json: {
            status: :unprocessable_entity,
            message: 'Failed to update folder',
            errors: @folder.errors.full_messages
          }
        end
      end

      # DELETE /api/v1/folders/:id
      def destroy
        @folder.destroy
        render json: {
          status: :ok,
          message: 'Folder deleted successfully'
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
