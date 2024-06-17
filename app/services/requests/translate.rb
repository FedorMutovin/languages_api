# frozen_string_literal: true

module Requests
  class Translate < Base
    MODEL = 'gpt-3.5-turbo'
    MAX_TOKENS = 100
    ACTION = 'translate'

    private

    def system_content
      <<~PROMPT.squish
        You are a professional translator.
        Your task is to translate the given text from #{source_language} to #{target_language}.
        Please return the response in JSON format like this: {"body": "[Translated text]"}
        Translated text should always start with a capital letter
      PROMPT
    end

    def user_content
      "Translate text from #{source_language} to #{target_language}: #{request_message.body}"
    end
  end
end
