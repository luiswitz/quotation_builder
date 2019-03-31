# frozen_string_literal: true

class PriceCalculatorContainer
  def initialize
    @calculators = {}
  end

  def get(key)
    @calculators[key]
  end

  def add_calculator(key, calculator)
    @calculators[key] = calculator
  end

  def defined?(key)
    @calculators.key?(key)
  end
end
