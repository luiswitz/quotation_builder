# frozen_string_literal: true

module Responses
  module Quotations
    class Show < Responses::Base
      def initialize(quotation, total)
        @quotation = quotation
        @total = total
      end

      def to_h
        user = @quotation.user

        {
          id: @quotation.id,
          user: {
            name: user.name,
            email: user.email,
            phone_number: user.phone_number
          },
          line_items: line_items,
          total: @total
        }
      end

      def status
        200
      end

      private

      def line_items
        @quotation.line_items.map do |line_item|
          {
            id: line_item.product.id,
            name: line_item.product.name,
            price: line_item.total,
            details: line_item.details
          }
        end
      end
    end
  end
end
