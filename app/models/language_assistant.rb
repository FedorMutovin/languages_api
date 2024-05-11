# frozen_string_literal: true

class LanguageAssistant < ApplicationRecord
  belongs_to :account
  has_many :message_histories, dependent: :destroy
end
