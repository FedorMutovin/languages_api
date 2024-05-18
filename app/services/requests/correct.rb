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
       Your task is to correct the text for any grammatical errors and provide a structured response.
       The response must follow this format:\n\n
       Correction: <div><strong>[Corrected text or 'No corrections needed']</strong></div>\n<br/>
       \nExplanation: <div>[Explanation of the corrections made or why none were needed]</div>
       If the text is already correct, The response must be this format:\n\n
       Correction: <div><strong>['No corrections needed']</strong></div>\n<br/>\n
       Explanation: <div>['The original text is grammatically correct.']</div>"
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
