class Product < ApplicationRecord
  PRODUCT_TYPES = %w[subscription service goods]

  validates :name, presence: true
  validates :price, presence: true
  validates :kind, presence: true
  validates :kind, inclusion: { in: PRODUCT_TYPES }
end
