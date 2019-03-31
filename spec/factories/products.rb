# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { 'the-product' }
    price { 10.00 }
    kind { 'goods' }
  end
end
