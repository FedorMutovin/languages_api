# frozen_string_literal: true

class Request < ApplicationRecord
  DEFAULT_ACTIONS = %w[translation correction].freeze
  belongs_to :account
  belongs_to :request_message, class_name: 'Message', inverse_of: :request
  belongs_to :response_message, class_name: 'Message', inverse_of: :response

  validates :action, presence: true, inclusion: DEFAULT_ACTIONS
end
