# frozen_string_literal: true

module Responses
  class Unauthorized < Responses::Base
    def to_h
      {
        message: 'Unauthorized. Must provide credentials'
      }
    end

    def status
      401
    end
  end
end
