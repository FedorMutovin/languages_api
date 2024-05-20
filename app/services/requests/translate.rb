# frozen_string_literal: true

module Requests
  class Translate < Base
    MODEL = 'gpt-3.5-turbo'
    MAX_TOKENS = 100
    ACTION = 'translation'

    private

    def system_content
      "You are a professional translator.
       Your task is to translate the given text from #{source_language} to #{target_language}.
       The response must follow this format:\n\nTranslation: <div><strong>[Translated text]</strong></div>"
    end

    def user_content
      "Translate text from #{source_language} to #{target_language}: #{request_message.body}"
    end

    def action
      ACTION
    end

    def model
      MODEL
    end

    def max_tokens
      MAX_TOKENS
    end
  end
end
