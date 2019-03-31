# frozen_string_literal: true

class Product < ApplicationRecord
  PRODUCT_TYPES = %w[subscription service goods].freeze

  validates :name, presence: true
  validates :price, presence: true
  validates :kind, presence: true
  validates :kind, inclusion: { in: PRODUCT_TYPES }
end
