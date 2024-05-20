# frozen_string_literal: true

class AccountLearningLanguageRepository < ApplicationRepository
  def add_current_learning_language(attrs)
    add(attrs.merge(current: true))
  end
end
