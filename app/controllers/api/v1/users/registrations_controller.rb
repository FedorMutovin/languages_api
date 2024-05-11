# frozen_string_literal: true

module Api
  module V1
    module Users
      class RegistrationsController < Devise::RegistrationsController
        respond_to :json

        def create
          build_resource(sign_up_params)

          resource.save
          yield resource if block_given?
          respond_with resource
        end

        protected

        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password language_id])
        end

        def sign_up_params
          params.require(:user).permit(:email, :password, :language_id)
        end

        private

        def respond_with(resource, _opts = {})
          resource.persisted? ? register_success : register_failed
        end

        def register_success
          token = Warden::JWTAuth::UserEncoder.new.call(resource, :user, nil)[0]
          response.set_header('Authorization', "Bearer #{token}")
          render json: UserSerializer.render_as_json(resource), status: :created
        end

        def register_failed
          render json: { errors: resource.errors.messages }, status: :unprocessable_entity
        end
      end
    end
  end
end
