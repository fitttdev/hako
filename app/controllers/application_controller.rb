# frozen_string_literal: true

class ApplicationController < ActionController::API
  include CurrentUser

  before_action :authenticate_user!

  private

  def current_user
    @current_user ||= CurrentUser.current_user
  end
end
