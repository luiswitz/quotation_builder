# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PriceCalculator::GoodsPriceCalculator do
  let(:quantity) { '5' }
  let(:price) { 15.00 }

  let(:price_factors) do
    {
      quantity: quantity,
    }
  end

  let(:calculate) { subject.calculate(price, price_factors) }
  let(:to_s) { subject.to_s(price, price_factors) }

  describe '#calculate' do
    context 'with valid parameters' do
      it 'calculates the correct price' do
        expect(calculate).to eq(75.00)
      end
    end

    context 'with an invalid quantity' do
      let(:quantity) { 0 }

      it 'throws an error' do
        expect { calculate }.to raise_error do |error|
          expect(error).to be_an(ArgumentError)
          expect(error.message).to eq('Invalid quantity')
        end
      end
    end

    context 'with invalid price' do
      let(:price) { 'foo' }

      it 'throws an error' do
        expect { calculate }.to raise_error do |error|
          expect(error).to be_an(ArgumentError)
          expect(error.message).to eq('Invalid price')
        end
      end
    end
  end

  describe '#to_s' do
    let(:expected_information) do
      '5 Goods for 15.0 each'
    end

    it 'outputs the correct information' do
      expect(to_s).to eq(expected_information)
    end
  end
end
