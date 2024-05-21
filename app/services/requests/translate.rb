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
       Please return the response in JSON format like this: {\"translation\": \"[Translated text]\"}
       Translated text should always start with a capital letter"
    end

    def user_content
      "Translate text from #{source_language} to #{target_language}: #{request_message.body["message"]}"
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
