# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PriceCalculator::SubscriptionPriceCalculator do
  subject do
    described_class.new
  end

  let(:price) { price }
  let(:price_factors) do
    {
      start_date: start_date,
      end_date: end_date,
    }
  end

  let(:start_date) { '2019-04-01' }
  let(:end_date) { '2019-05-01' }
  let(:price) { 15.00 }

  let(:calculate) { subject.calculate(price, price_factors) }
  let(:to_s) { subject.to_s(price, price_factors) }

  describe '#calculate' do
    context 'with a valid range date' do
      it 'calculates the value' do
        expect(calculate).to eq(330.00)
      end

      context 'when end date begins before start date' do
        let(:end_date) { '2019-04-01' }
        let(:start_date) { '2019-05-01' }

        it 'throws an error' do
          expect { calculate }.to raise_error do |error|
            expect(error).to be_equal_to(ArgumentError.new('Invalid date range'))
          end
        end
      end
    end

    context 'with an invalid date range' do
      context 'when start_date is invalid' do
        let(:start_date) { 'foo' }

        it 'throws an error' do
          expect { calculate }.to raise_error do |error|
            expect(error).to be_a(ArgumentError)
            expect(error.message).to eq('invalid date')
          end
        end
      end

      context 'when end date is invalid' do
        let(:end_date) { 'foo' }

        it 'throws an error' do
          expect { calculate }.to raise_error do |error|
            expect(error).to be_a(ArgumentError)
            expect(error.message).to eq('invalid date')
          end
        end
      end

      context 'when the price is invalid' do
        let(:price) { 'foo' }

        it 'throws an error' do
          expect { calculate }.to raise_error do |error|
            expect(error).to be_a(ArgumentError)
            expect(error.message).to eq('Invalid price')
          end
        end
      end
    end
  end

  describe '#to_s' do
    let(:expected_information) do
      'Subscription from 2019-04-01 to 2019-05-01 for 15.0 a day'
    end

    it 'outputs the product calculos information' do
      expect(to_s).to eq(expected_information)
    end
  end
end
