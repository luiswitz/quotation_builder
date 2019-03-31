# frozen_string_literal: true

module PriceCalculator
  class Base
    def calculate
      raise '#calculate must be implemented'
    end

    def to_s
      raise '#to_s must be implemented'
    end
  end
end
