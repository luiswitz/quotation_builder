# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PriceCalculatorContainer do
  subject do
    described_class.new
  end

  let(:calculator) { double(:calculator) }
  let(:key) { 'the-calculator' }

  let(:get) { subject.get(key) }
  let(:add_calculator) { subject.add_calculator(key, calculator) }

  describe '#add_calculator' do
    it 'adds the calculator to the container' do
      add_calculator

      expect(get).to eq(calculator)
    end
  end

  describe '#defined?' do
    context 'when a key is defined' do
      it 'returns true' do
        add_calculator

        expect(subject.defined?(key)).to eq(true)
      end
    end

    context 'when a key is not defined' do
      it 'returns false' do
        expect(subject.defined?(key)).to eq(false)
      end
    end
  end
end
