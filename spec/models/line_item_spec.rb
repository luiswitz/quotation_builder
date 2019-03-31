# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LineItem, type: :model do
  subject do
    FactoryBot.build(:line_item, price_factors: price_factors)
  end

  let(:quotation) { FactoryBot.build(:quotation, line_items: [subject]) }

  let(:price_factors) { '{ "quantity": 100 }' }
  let(:product_price) { subject.product.price }

  it { is_expected.to belong_to(:quotation) }
  it { is_expected.to belong_to(:product) }
  it { is_expected.to validate_presence_of(:product) }
  it { is_expected.to validate_presence_of(:price_factors) }
  it { is_expected.to validate_presence_of(:quotation) }

  let(:calculator) { double(:calculator) }
  let(:kind) { subject.product.kind }
  let(:total) { subject.total }
  let(:details) { subject.details }

  before do
    quotation.save
  end

  describe '#total' do
    before do
      allow(calculator).to receive(:calculate)
        .with(product_price, price_factors)

      expect_any_instance_of(PriceCalculators).to receive(:get)
        .with(kind)
        .and_return(calculator)
    end

    context 'with correct price_factors' do
      it 'gets the correct calculator and does the math' do
        expect(calculator).to receive(:calculate)
          .with(product_price, quantity: 100)

        total
      end
    end

    context 'with wrong price factors' do
      let(:price_factors) { 'foo' }

      it 'throws an error' do
        expect { total }.to raise_error do |error|
          expect(error).to be_equal_to(ArgumentError.new('Invalid price factors'))
        end
      end
    end
  end

  describe '#details' do
    before do
      allow(calculator).to receive(:calculate)
        .with(product_price, price_factors)

      expect_any_instance_of(PriceCalculators).to receive(:get)
        .with(kind)
        .and_return(calculator)
    end

    it 'returns the line_item details' do
      expect(calculator).to receive(:to_s)
        .with(product_price, quantity: 100)

      details
    end
  end
end
