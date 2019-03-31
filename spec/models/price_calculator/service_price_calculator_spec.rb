# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PriceCalculator::ServicePriceCalculator do
  subject do
    described_class.new
  end

  let(:day_of_the_week) { '1' }
  let(:start_time) { '10:00' }
  let(:end_time) { '11:00' }
  let(:number_of_weeks) { '3' }

  let(:price_factors) do
    {
      day_of_the_week: day_of_the_week,
      start_time: start_time,
      end_time: end_time,
      number_of_weeks: number_of_weeks
    }
  end

  let(:price) { 15.00 }
  let(:calculate) { subject.calculate(price, price_factors) }
  let(:to_s) { subject.to_s(price, price_factors) }

  describe '#calculate' do
    context 'with valid parameters' do
      it 'calculates the correct value' do
        expect(calculate).to eq(45.00)
      end

      context 'when it is a Sunday' do
        let(:day_of_the_week) { '0' }

        let(:expected_error) do
          ArgumentError.new('Can not be on Sunday')
        end

        it 'throws an error' do
          expect { calculate }.to raise_error do |error|
            expect(error).to be_equal_to(expected_error)
          end
        end
      end

      context 'when it starts before 09:00' do
        let(:start_time) { '08:00' }

        let(:expected_error) do
          ArgumentError.new('Can not start before 09:00')
        end

        it 'throws an error' do
          expect { calculate }.to raise_error do |error|
            expect(error).to be_equal_to(expected_error)
          end
        end
      end

      context 'when it ends after 19:00' do
        let(:end_time) { '20:00' }

        let(:expected_error) do
          ArgumentError.new('Can not end after 19:00')
        end

        it 'throws an error' do
          expect { calculate }.to raise_error do |error|
            expect(error).to be_equal_to(expected_error)
          end
        end
      end

      context 'when end time starts before start time' do
        let(:start_time) { '18:00' }
        let(:end_time) { '10:00' }

        let(:expected_error) do
          ArgumentError.new('Invalid time range')
        end

        it 'throws an error' do
          expect { calculate }.to raise_error do |error|
            expect(error).to be_equal_to(expected_error)
          end
        end
      end
    end

    context 'with invalid parameters' do
      context 'when the starts time is invalid' do
        let(:start_time) { 'foo' }

        let(:expected_error) do
          ArgumentError.new("no time information in \"#{start_time}\"")
        end

        it 'throws an error' do
          expect { calculate }.to raise_error do |error|
            expect(error).to be_equal_to(expected_error)
          end
        end
      end

      context 'when the end time is invalid' do
        let(:end_time) { 'foo' }

        let(:expected_error) do
          ArgumentError.new("no time information in \"#{end_time}\"")
        end

        it 'throws an error' do
          expect { calculate }.to raise_error do |error|
            expect(error).to be_equal_to(expected_error)
          end
        end
      end

      context 'when day of week is invalid' do
        context 'when it is a string' do
          let(:day_of_the_week) { 'foo' }

          let(:expected_error) do
            ArgumentError.new("invalid value for Integer(): \"#{day_of_the_week}\"")
          end

          it 'throws an error' do
            expect { calculate }.to raise_error do |error|
              expect(error).to be_equal_to(expected_error)
            end
          end
        end

        context 'when it is an invalid number' do
          let(:day_of_the_week) { -10 }

          let(:expected_error) do
            ArgumentError.new('Invalid day of the week')
          end

          it 'throws an error' do
            expect { calculate }.to raise_error do |error|
              expect(error).to be_equal_to(expected_error)
            end
          end
        end
      end

      context 'when number of weeks is invalid' do
        let(:number_of_weeks) { 'foo' }

        let(:expected_error) do
          ArgumentError.new("invalid value for Integer(): \"#{number_of_weeks}\"")
        end

        it 'throws an error' do
          expect { calculate }.to raise_error do |error|
            expect(error).to be_equal_to(expected_error)
          end
        end

        context 'when it is a negative number' do
          let(:number_of_weeks) { -10 }

          let(:expected_error) do
            ArgumentError.new('Invalid number of weeks')
          end

          it 'throws an error' do
            expect { calculate }.to raise_error do |error|
              expect(error).to be_equal_to(expected_error)
            end
          end
        end
      end

      context 'when the price is invalid' do
        let(:price) { 'foo' }

        let(:expected_error) do
          ArgumentError.new('Invalid price')
        end

        it 'throws an error' do
          expect { calculate }.to raise_error do |error|
            expect(error).to be_equal_to(expected_error)
          end
        end
      end
    end
  end

  describe '#to_s' do
    let(:expected_information) do
      'Service every Monday from 10:00 to 11:00 for the next 3 weeks for 15.0 per hour'
    end

    it 'outputs the product calculus information' do
      expect(to_s).to eq(expected_information)
    end
  end
end
