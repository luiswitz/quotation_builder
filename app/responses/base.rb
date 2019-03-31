# frozen_string_literal: true

module Responses
  class Base
    def to_h
      raise 'to_h must be implemented'
    end

    def status
      raise 'status must be implemented'
    end
  end
end
