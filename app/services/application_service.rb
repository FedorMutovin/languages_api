# frozen_string_literal: true

class ApplicationService
  extend Dry::Initializer[undefined: false]
  include Dry::Monads[:result, :do, :try]

  def self.call(...) = new(...).call

  def call
    NotImplementedError
  end

  protected

  def handle_repository_operation(repository:, operation:, args: {})
    result = Try { repository.new.public_send(operation, **args) }
    result.or { |exception| handle_failure(exception, repository, operation, args) }
  end

  private

  def handle_failure(exception, repository, operation, args)
    error_detail = construct_error_detail(exception, repository, operation, args)
    log_error(error_detail)
    Failure(error_detail)
  end

  def construct_error_detail(exception, repository, operation, arguments)
    {
      error: exception.message,
      backtrace: exception.backtrace.take(5),
      repository: repository.name,
      operation:,
      arguments:
    }
  end

  def log_error(detail)
    Rails.logger.error("Failed operation #{detail[:operation]} on #{detail[:repository]}: #{detail[:error]}")
    Rails.logger.error("Arguments: #{detail[:arguments]}")
    Rails.logger.error(detail[:backtrace].join("\n"))
  end
end
