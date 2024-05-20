# frozen_string_literal: true

module Api
  module V1
    module Account
      class AccountLearningLanguagesController < Api::V1::BaseController
        def current
          repo = AccountLearningLanguageRepository.new
          resource = repo.find_by(account_id: current_account.id, current: true)
          render json: AccountLearningLanguageSerializer.render(resource)
        end

        def create
          repo = AccountLearningLanguageRepository.new
          resource = repo.add_current_learning_language(
            account_learning_languages_params.merge(account: current_user.account)
          )
          render json: AccountLearningLanguageSerializer.render(resource)
        end

        private

        def account_learning_languages_params
          params.require(:account_learning_languages).permit(:language_id)
        end
      end
    end
  end
end
