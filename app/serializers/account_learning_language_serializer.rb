# frozen_string_literal: true

class AccountLearningLanguageSerializer < Blueprinter::Base
  identifier :id
  fields :account_id, :language_id
end
