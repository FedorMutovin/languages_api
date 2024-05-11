# frozen_string_literal: true

module Api
  module V1
    class AccountLearningLanguagesController < BaseController
      def create
        repo = AccountLearningLanguageRepository.new
        resource = repo.add(account_learning_languages_params.merge(account: current_user.account))
        render json: AccountLearningLanguageSerializer.render(resource)
      end

      private

      def account_learning_languages_params
        params.require(:account_learning_languages).permit(:language_id)
      end
    end
  end
end
