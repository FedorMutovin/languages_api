# frozen_string_literal: true

class ApplicationController < ActionController::API
  def current_account
    @current_account ||= current_user&.account
  end
end
