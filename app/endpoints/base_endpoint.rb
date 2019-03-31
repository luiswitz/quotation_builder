# frozen_string_literal: true

module Endpoints
  class BaseEndpoint
    UnhandledError = Class.new(::Responses::InternalError)

    private

    def handle_errors
      yield
    rescue StandardError => error
      handle_error(error)
    end

    def handle_error(error)
      if error.is_a?(ArgumentError)
        return Responses::UnprocessableEntity.new(errors: error.message)
      end

      if error.is_a?(ActiveRecord::RecordInvalid)
        return Responses::UnprocessableEntity.new(errors: error.message)
      end

      UnhandledError.new(error)
    end
  end
end
