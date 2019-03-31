# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Responses::Products::Index do
  subject do
    described_class.new(products)
  end

  let(:products) do
    [product_1, product_2]
  end

  let(:product_1) { FactoryBot.build(:product, id: 1) }
  let(:product_2) { FactoryBot.build(:product, id: 2) }

  describe '#to_h' do
    let(:expected_response) do
      {
        data: [
          {
            id: product_1.id,
            name: product_1.name,
            price: product_1.price,
            kind: product_1.kind
          },
          {
            id: product_2.id,
            name: product_2.name,
            price: product_2.price,
            kind: product_2.kind
          },
        ]
      }
    end

    it 'returns a producsts collection' do
      expect(subject.to_h).to eq(expected_response)
    end
  end

  describe '#status' do
    it 'returns 200 status code' do
      expect(subject.status).to eq(200)
    end
  end
end
