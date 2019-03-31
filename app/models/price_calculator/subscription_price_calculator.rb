# frozen_string_literal: true

module PriceCalculator
  class SubscriptionPriceCalculator < PriceCalculator::Base
    def calculate(price, price_factors)
      sanitize_params(price, price_factors)

      attended_days * price
    end

    def to_s(price, price_factors)
      sanitize_params(price, price_factors)

      "Subscription from #{start_date} to #{end_date} for #{price} a day"
    end

    private

    def sanitize_params(price, price_factors)
      @start_date = sanitize_start_date(price_factors[:start_date])
      @end_date = sanitize_end_date(price_factors[:end_date])
      @price = sanitize_price(price)
      validate_date_range
    end

    def sanitize_start_date(start_date)
      start_date = Date.parse(start_date)

      start_date
    rescue TypeError
      raise ArgumentError, 'invalid start date'
    end

    def sanitize_end_date(end_date)
      end_date = Date.parse(end_date)

      end_date
    rescue TypeError
      raise ArgumentError, 'invalid end date'
    end

    def sanitize_price(price)
      unless price.is_a?(Float)
        raise ArgumentError, 'Invalid price'
      end

      price
    end

    def validate_date_range
      if start_date > end_date
        raise ArgumentError, 'Invalid date range'
      end
    end

    def attended_days
      (start_date...end_date).select do |day|
        week_days.include?(day.wday)
      end.count
    end

    def week_days
      [1, 2, 3, 4, 5]
    end

    attr_accessor :start_date
    attr_accessor :end_date
    attr_accessor :price
  end
end
