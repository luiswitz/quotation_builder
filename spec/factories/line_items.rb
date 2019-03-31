# frozen_string_literal: true

FactoryBot.define do
  factory :line_item do
    quotation
    product
    price_factors { '{ "quantity": 10 }' }
  end
end
