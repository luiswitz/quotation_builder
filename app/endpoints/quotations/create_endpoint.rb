# frozen_string_literal: true

module Endpoints
  module Quotations
    class CreateEndpoint < Endpoints::BaseEndpoint
      def perform(payload)
        handle_errors do
          payload = payload[:quotation].deep_symbolize_keys

          line_items = build_line_items(payload[:line_items])

          user = handle_user(payload[:user])

          quotation = Quotation.new(user: user, line_items: line_items)

          if quotation.save!
            total = quotation.total
            return Responses::Quotations::Show.new(quotation, total)
          end
        end
      end

      private

      def build_line_items(line_items)
        line_items.map do |line_item|
          LineItem.new(
            product_id: line_item[:id],
            price_factors: line_item[:price_factors].to_json
          )
        end
      end

      def handle_user(user)
        new_user = User.find_by_email(user[:email])

        unless new_user
          return User.create!(user)
        end

        unless new_user.password == user[:password]
          raise ArgumentError, 'invalid credentials'
        end

        new_user
      end
    end
  end
end
