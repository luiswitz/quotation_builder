# frozen_string_literal: true

class PriceCalculators < PriceCalculatorContainer
  def initialize
    super
    add_calculator('goods', PriceCalculator::GoodsPriceCalculator.new)
    add_calculator('service', PriceCalculator::ServicePriceCalculator.new)
    add_calculator('subscription', PriceCalculator::SubscriptionPriceCalculator.new)
  end
end
