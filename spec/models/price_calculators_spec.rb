# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PriceCalculators do
  subject do
    described_class.new
  end

  let(:service_calculator) do
    PriceCalculator::ServicePriceCalculator.new
  end

  let(:subscription_calculator) do
    PriceCalculator::SubscriptionPriceCalculator.new
  end

  let(:goods_calculator) do
    PriceCalculator::GoodsPriceCalculator.new
  end

  it 'adds ServicePriceCalculator defined' do
    expect(subject.get('service')).to be_equal_to(service_calculator)
  end

  it 'has SubscriptionPriceCalculator defined' do
    expect(subject.get('subscription')).to be_equal_to(subscription_calculator)
  end

  it 'has GoodsPriceCalculator defined' do
    expect(subject.get('goods')).to be_equal_to(goods_calculator)
  end
end
