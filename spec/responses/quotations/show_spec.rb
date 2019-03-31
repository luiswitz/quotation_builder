# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Responses::Quotations::Show do
  subject do
    described_class.new(quotation, total)
  end

  let(:quotation) { FactoryBot.build(:quotation, line_items: line_items) }
  let(:total) { quotation.total }
  let(:line_items) { [line_item_1, line_item_2] }
  let(:line_item_1) { FactoryBot.build(:line_item) }
  let(:line_item_2) { FactoryBot.build(:line_item) }

  before do
    quotation.save
  end

  describe '#to_h' do
    let(:expected_response) do
      {
        id: quotation.id,
        user: {
          name: quotation.user.name,
          email: quotation.user.email,
          phone_number: quotation.user.phone_number
        },
        line_items: [
          {
            id: line_item_1.product.id,
            name: line_item_1.product.name,
            price: line_item_1.total,
            details: line_item_1.details
          },
          {
            id: line_item_2.product.id,
            name: line_item_2.product.name,
            price: line_item_2.total,
            details: line_item_2.details
          },
        ],
        total: total
      }
    end

    it 'returns a quotation response' do
      expect(subject.to_h).to eq(expected_response)
    end
  end

  describe '#status' do
    it 'returns a 200 status code' do
      expect(subject.status).to eq(200)
    end
  end
end
