# frozen_string_literal: true

class MessageHistoryCategory < ApplicationRecord
  has_many :message_histories, dependent: :destroy, inverse_of: :category
  validates :name, presence: true
end
