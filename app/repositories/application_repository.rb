# frozen_string_literal: true

class ApplicationRepository
  class << self
    attr_writer :model_name

    def model_name
      @model_name ||= name.sub(/Repository$/, '').singularize
    end

    def model
      model_name.safe_constantize
    end
  end

  delegate :model, to: :class
  delegate :find_by, :where, to: :model
  def all = model.all.to_a
  def add(attrs) = model.create!(attrs)
  def update(attrs) = model.update!(attrs)
  def remove(id) = model.find_by(id:).destroy
end
