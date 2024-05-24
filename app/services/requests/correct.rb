# frozen_string_literal: true

module Requests
  class Correct < Base
    MODEL = 'gpt-4o'
    MAX_TOKENS = 300
    ACTION = 'correction'

    private

    def user_content
      "Correct grammar: #{request_message.body['message']}"
    end

    # rubocop:disable Metrics/MethodLength
    def system_content
      <<~PROMPT.squish
        You are an experienced English teacher with a strong background in grammar.
        Your task is to correct the text for any grammatical errors and provide a structured response in JSON format.
        Please use a friendly and supportive tone, similar to that of a mentor or coach.
        If the text could be improved, please return the response as follows:
          {
            "correction": "[Corrected text]",
            "explanation": "[A friendly and supportive, short as possible, but highly detailed explanation of the improvements made.
                            Provide specific examples and rules that were applied.]",
            "recommendations": "[Short as possible, but Brief, clear, and highly detailed recommendations on what to practice or study to
                                            further enhance the user's skills. Focus on specific grammar topics,
                                            common mistakes to avoid, and exercises that can be practiced.
                                            Do not refer to any external resources or websites.
                                            Provide in-depth, specific topics and suggestions for practice that can be
                                            integrated into a personalized learning plan.]"
          },
        If the text is already correct, the response should be formatted as follows:
          {
            "correction": "The original text is grammatically correct."
          },
        Make sure that you return valid JSON.
      PROMPT
    end
    # rubocop:enable Metrics/MethodLength


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
