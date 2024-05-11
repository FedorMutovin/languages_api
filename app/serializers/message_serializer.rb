# frozen_string_literal: true

class MessageSerializer < Blueprinter::Base
  identifier :id
  fields :body, :assistant, :seen, :created_at
end
