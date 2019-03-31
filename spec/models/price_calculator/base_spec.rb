# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PriceCalculator::Base do
  let(:calculate) { subject.calculate }
  let(:to_s) { subject.to_s }

  describe '#calculate' do
    it 'throws an error' do
      expect { calculate }.to raise_error('#calculate must be implemented')
    end
  end

  describe '#to_s' do
    it 'trhows an error' do
      expect { to_s }.to raise_error('#to_s must be implemented')
    end
  end
end
