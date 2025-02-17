# frozen_string_literal: true

module Api
  module V1
    module Users
      class SessionsController < Devise::SessionsController
        respond_to :json

        private

        def respond_with(resource, _opts = {})
          render json: UserSerializer.render_as_json(resource), status: :ok
        end

        def respond_to_on_destroy
          head :no_content
        end
      end
    end
  end
end
