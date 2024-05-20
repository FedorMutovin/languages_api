# frozen_string_literal: true

class AccountLearningLanguageSerializer < Blueprinter::Base
  identifier :id
  fields :account_id, :current
  association :language, blueprint: LanguageSerializer
end
