# frozen_string_literal: true

class LanguageSerializer < Blueprinter::Base
  identifier :id
  fields :name, :locale
  view :with_permissions do
    fields :for_interface, :for_learning
  end
end
