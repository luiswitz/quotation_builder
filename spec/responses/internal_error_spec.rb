# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Responses::InternalError do
  subject do
    described_class.new(error)
  end

  let(:error) do
    double(:error, message: 'the-error')
  end

  describe '#to_h' do
    it 'returns the error' do
      expected_response = { error: 'the-error' }
      expect(subject.to_h).to eq(expected_response)
    end
  end

  describe '#status' do
    it 'returns a 500 status code' do
      expect(subject.status).to eq(500)
    end
  end
end
