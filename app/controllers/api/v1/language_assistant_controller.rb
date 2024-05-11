# frozen_string_literal: true

module Api
  module V1
    class LanguageAssistantController < BaseController
      def message_history
        repo = MessageHistoryRepository.new
        history = repo.find_assistant_history(account_id: current_account.id)
        render json: MessageHistorySerializer.render_as_json(history)
      end

      def create_message
        repo = MessageRepository.new
        resource = repo.add_user_message(message_params)
        if resource.persisted?
          render json: MessageSerializer.render(resource), status: :created
        else
          render json: { errors: resource.errors.messages }, status: :unprocessable_entity
        end
      end

      private

      def message_params
        params.require(:message).permit(:body, :message_history_id)
      end
    end
  end
end
