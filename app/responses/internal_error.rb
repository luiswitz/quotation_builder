# frozen_string_literal: true

module Responses
  class InternalError < Responses::Base
    def initialize(error)
      @error = error
    end

    def to_h
      {
        error: @error.message
      }
    end

    def status
      500
    end
  end
end
