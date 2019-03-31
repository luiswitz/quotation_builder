# frozen_string_literal: true

module PriceCalculator
  class GoodsPriceCalculator
    def calculate(price, price_factors)
      sanitize_params(price, price_factors)

      price * quantity
    end

    def to_s(price, price_factors)
      sanitize_params(price, price_factors)

      "#{quantity} Goods for #{price} each"
    end

    private

    def sanitize_params(price, price_factors)
      @quantity = sanitize_quantity(price_factors[:quantity].to_i)
      @price = sanitize_price(price)
    end

    def sanitize_quantity(quantity)
      if quantity < 1
        raise ArgumentError, 'Invalid quantity'
      end

      quantity
    end

    def sanitize_price(price)
      unless price.is_a?(Float)
        raise ArgumentError, 'Invalid price'
      end

      price
    end

    attr_reader :quantity
    attr_reader :price
  end
end
