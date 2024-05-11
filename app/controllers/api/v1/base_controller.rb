# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      before_action :authenticate_user!

      rescue_from ActionController::ParameterMissing, with: :handle_missing_param
      rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

      private

      def unauthorized_response
        head :unauthorized
      end

      def not_found_response
        head :not_found
      end

      def handle_missing_param(exception)
        render json: { errors: { exception.param => { blank: exception.message } } }, status: :unprocessable_entity
      end
    end
  end
end
