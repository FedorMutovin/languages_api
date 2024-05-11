# frozen_string_literal: true

module Accounts
  class Setup < ApplicationService
    option :user

    def call
      Account.transaction do
        account = yield create_account
        assistant = yield create_language_assistant(account)
        history = yield create_message_history(assistant)
        yield create_welcome_message(history)
      end
    end

    private

    def create_account
      handle_repository_operation(repository: AccountRepository, operation: :add, args: { user: })
    end

    def create_language_assistant(account)
      handle_repository_operation(repository: LanguageAssistantRepository, operation: :add, args: { account: })
    end

    def create_message_history(language_assistant)
      handle_repository_operation(
        repository: MessageHistoryRepository,
        operation: :add_for_assistant,
        args: { language_assistant: }
      )
    end

    def create_welcome_message(history)
      handle_repository_operation(
        repository: MessageRepository,
        operation: :add_welcome_message,
        args: { history:, locale: user.language.locale }
      )
    end
  end
end
