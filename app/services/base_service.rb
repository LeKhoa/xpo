# frozen_string_literal: true

class BaseService
  attr_accessor :error

  def success?
    error.nil?
  end

  protected

  def error!(error)
    self.error = error
  end

  def response_error!(response)
    # Rollbar.error(response.to_s)
    error!(response.to_s)
  end

  def execute_error!(e)
    # Rollbar.error(e)
    error!(e.message)
  end
end
