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
    if Rails.env.production?
      Rollbar.error(response.to_s)
    else
      puts "\n########## RESPONSE ERROR #########"
      puts response.to_s
      puts "###################################"
    end
    error!(response.to_s)
  end

  def execute_error!(e)
    if Rails.env.production?
      Rollbar.error(e)
    else
      puts "\n########## EXECUTE ERROR #########"
      puts e
      puts "###################################"
    end
    error!(e.message)
  end
end
