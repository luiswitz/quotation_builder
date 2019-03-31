# frozen_string_literal: true

module Endpoints
  module Products
    class IndexEndpoint
      def perform(_payload)
        products = Product.all.to_a

        Responses::Products::Index.new(products)
      end
    end
  end
end
