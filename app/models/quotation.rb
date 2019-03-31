# frozen_string_literal: true

class Quotation < ApplicationRecord
  belongs_to :user
  has_many :line_items

  validates :user, presence: true
  validates :line_items, presence: true
  validates_associated :line_items

  def total
    total = 0.00

    line_items.each do |line_item|
      total += line_item.total
    end

    total
  end
end
