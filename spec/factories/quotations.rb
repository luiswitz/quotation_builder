# frozen_string_literal: true

FactoryBot.define do
  factory :quotation do
    user

    trait :with_line_items do
      after :create do |quotation|
        create_list :line_item, 3, quotation: quotation
      end
    end
  end
end
