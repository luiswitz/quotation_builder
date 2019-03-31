# frozen_string_literal: true

module Responses
  class UnprocessableEntity < Responses::Base
    def initialize(errors:)
      @errors = errors
    end

    def to_h
      {
        message: 'Unprocessable Entity',
        errors: [errors].flatten
      }
    end

    def status
      422
    end

    private

    attr_reader :errors
  end
end
