# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      token = request.params[:token]
      payload = Warden::JWTAuth::TokenDecoder.new.call(token)
      user_id = payload['sub']

      repo = UserRepository.new
      current_user = repo.find_by(id: user_id)
      return reject_unauthorized_connection unless current_user

      current_user
    rescue StandardError
      reject_unauthorized_connection
    end
  end
end
