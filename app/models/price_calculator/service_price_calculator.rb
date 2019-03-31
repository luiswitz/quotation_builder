# frozen_string_literal: true

module PriceCalculator
  class ServicePriceCalculator < PriceCalculator::Base
    SUNDAY = 0
    MONDAY = 1
    SATURDAY = 6

    def calculate(price, price_factors)
      sanitize_params(price, price_factors)

      week_hours * @number_of_weeks * price
    end

    def to_s(price, price_factors)
      sanitize_params(price, price_factors)

      [
        "Service every #{humanized_day_of_the_week(@day_of_the_week)}",
        "from #{@start_time.to_formatted_s(:time)} to #{@end_time.to_formatted_s(:time)}",
        "for the next #{@number_of_weeks} weeks for #{@price} per hour"
      ].join(' ')
    end

    private

    def sanitize_params(price, price_factors)
      @day_of_the_week = sanitize_day_of_the_week(price_factors[:day_of_the_week])
      @start_time = sanitize_start_time(price_factors[:start_time])
      @end_time = sanitize_end_time(price_factors[:end_time])
      @number_of_weeks = sanitize_number_of_weeks(price_factors[:number_of_weeks])
      @price = sanitize_price(price)
      validate_time_range
    end

    def week_hours
      @end_time.hour - @start_time.hour
    end

    def sanitize_day_of_the_week(day_of_the_week)
      day_of_the_week = Integer(day_of_the_week)

      if day_of_the_week == SUNDAY
        raise ArgumentError, 'Can not be on Sunday'
      end

      unless (MONDAY..SATURDAY).member?(day_of_the_week)
        raise ArgumentError, 'Invalid day of the week'
      end

      day_of_the_week
    rescue TypeError
      raise ArgumentError, 'Invalid day of the week'
    end

    def sanitize_start_time(start_time)
      start_time = Time.parse(start_time)

      if start_time.hour < 9
        raise ArgumentError, 'Can not start before 09:00'
      end

      start_time
    rescue TypeError
      raise ArgumentError, 'Invalid Start Time'
    end

    def sanitize_end_time(end_time)
      end_time = Time.parse(end_time)

      if end_time.hour > 19
        raise ArgumentError, 'Can not end after 19:00'
      end

      end_time
    rescue TypeError
      raise ArgumentError, 'Invalid End Time'
    end

    def sanitize_number_of_weeks(number_of_weeks)
      number_of_weeks = Integer(number_of_weeks)

      unless number_of_weeks.positive?
        raise ArgumentError, 'Invalid number of weeks'
      end

      number_of_weeks
    rescue TypeError
      raise ArgumentError, 'Invalid number of weeks'
    end

    def sanitize_price(price)
      unless price.is_a?(Float)
        raise ArgumentError, 'Invalid price'
      end

      price
    end

    def validate_time_range
      if @start_time > @end_time
        raise ArgumentError, 'Invalid time range'
      end
    end

    def humanized_day_of_the_week(day)
      Date::DAYNAMES[day]
    end
  end
end
