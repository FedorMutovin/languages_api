# frozen_string_literal: true

module Requests
  class Correct < Base
    MODEL = 'gpt-4o'
    MAX_TOKENS = 300
    ACTION = 'correction'

    private

    def user_content
      "Correct grammar: #{request_message.body}"
    end

    def system_content
      "You are an experienced English teacher with a strong background in grammar.
        Your task is to correct the text for any grammatical errors and provide a structured response in JSON format.
        If the text contains errors, please return the response as follows:
          {
            \"correction\": \"[Corrected text]\",
            \"explanation\": \"[Explanation of the corrections made]\",
            \"recommendations\": \"[Brief, clear recommendations on what to practice or study to address the mistakes made]\"
          }
        If the text is already correct, the response should be formatted as follows:
          {
            \"correction\": \"The original text is grammatically correct.\",
          }"
    end

    def language
      account.learning_languages.first.name
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
