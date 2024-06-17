# frozen_string_literal: true

module Requests
  class Correct < Base
    MODEL = 'gpt-4o'
    MAX_TOKENS = 300
    ACTION = 'correct'

    private

    def user_content
      "Correct grammar: #{request_message.body}"
    end

    # rubocop:disable Metrics/MethodLength
    def system_content
      <<~PROMPT.squish
        You are an experienced English teacher with a strong background in grammar.
        Your task is to correct the text for any grammatical errors and provide a structured response in JSON format.
        Please use a friendly and supportive tone, similar to that of a mentor or coach.
        You may use HTML tags to improve text readability, but limit their use to line breaks (<br>), bold (<b>),#{' '}
        underline (<u>), and lists (<ul>, <ol>, <li>), and always ensure that the returned HTML is valid.
        If the text could be improved, please return the response as follows:
          {
            "body": "Here is the improved text:: [Corrected text in bold] and one a new line(as html) a friendly and supportive,#{' '}
                      short as possible, but highly detailed explanation of the improvements made.#{' '}
                      Provide specific examples and rules that were applied]",
          },
        If the text is already correct, the response should be formatted as follows:
          {
            "body": "The original text is grammatically correct."
          },
        Make sure that you return valid JSON.
        Make sure your response is always in #{user_language}.#{' '}
      PROMPT
    end
    # rubocop:enable Metrics/MethodLength

    def user_language
      user.language.name
    end
  end
end
