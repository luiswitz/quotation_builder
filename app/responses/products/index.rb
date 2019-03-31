# frozen_string_literal: true

module Responses
  module Products
    class Index < Responses::Base
      def initialize(products)
        @products = products
      end

      def to_h
        data = @products.map do |product|
          {
            id: product.id,
            name: product.name,
            price: product.price,
            kind: product.kind
          }
        end

        { data: data }
      end

      def status
        200
      end
    end
  end
end
