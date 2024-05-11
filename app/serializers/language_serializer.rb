# frozen_string_literal: true

class LanguageSerializer < Blueprinter::Base
  identifier :id
  fields :name, :locale, :for_interface, :for_learning
end
