# frozen_string_literal: true

class Request < ApplicationRecord
  AVAILABLE_ACTIONS = %w[translate correct explain].freeze
  belongs_to :chat
  belongs_to :request_message, class_name: 'Message', inverse_of: :request
  belongs_to :response_message, class_name: 'Message', inverse_of: :response

  validates :action, presence: true, inclusion: AVAILABLE_ACTIONS
end
