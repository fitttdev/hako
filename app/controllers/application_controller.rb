# frozen_string_literal: true

class ApplicationController < ActionController::API
  include CurrentUserAssigner
  before_action :set_current_user

  private

  def set_current_user
    @current_user = assign_current_user
  end
end
