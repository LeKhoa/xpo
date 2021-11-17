# frozen_string_literal: true

module Shrimpy
  class UserService < BaseService

    attr_reader :shrimpy_user

    def initialize(user)
      @shrimpy_user = user
    end

    def create_user
      response = ApiService.create_user(shrimpy_user.name)
      return response_error!(response.body) unless response.success?

      data = JSON.parse(response.body)
      shrimpy_user.update!(uuid: data['id'])
    rescue StandardError => e
      execute_error!(e)
    end

  end
end
