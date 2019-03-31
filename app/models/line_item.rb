# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :quotation

  validates_presence_of :product
  validates_presence_of :price_factors
  validates_presence_of :quotation
  validate :price_factors_value

  def total
    calculator.calculate(product.price, price_factors_hash)
  end

  def details
    calculator.to_s(product.price, price_factors_hash)
  end

  private

  def calculator
    PriceCalculators.new.get(product.kind)
  end

  def price_factors_hash
    unless valid_json?(price_factors)
      raise ArgumentError, 'Invalid price factors'
    end

    JSON.parse(price_factors).symbolize_keys
  end

  def price_factors_value
    unless valid_json?(price_factors)
      errors.add(:price_factors, 'has an invalid format')
    end
  end

  def valid_json?(value)
    !!JSON.parse(value)
  rescue JSON::ParserError
    false
  rescue TypeError
    false
  end
end
