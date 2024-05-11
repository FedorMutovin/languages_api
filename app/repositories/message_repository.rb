# frozen_string_literal: true

class MessageRepository < ApplicationRepository
  def add_welcome_message(history:, locale:)
    body = I18n.with_locale(locale) { I18n.t('language_assistant.welcome_message') }
    model.create!(history:, body:, assistant: true)
  end

  def add_user_message(attrs)
    add(attrs.merge(assistant: false))
  end
end
