# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Responses::UnprocessableEntity do
  subject do
    described_class.new(errors: errors)
  end

  let(:errors) { 'the-error' }

  describe '#to_h' do
    context 'when the error is a string' do
      it 'returns the correct message' do
        expected_hash = {
          message: 'Unprocessable Entity',
          errors: [errors]
        }

        expect(subject.to_h).to eq(expected_hash)
      end
    end

    context 'when the error is an array' do
      let(:errors) do
        ['the-error', 'the-other-error']
      end

      it 'returns the correct message' do
        expected_hash = {
          message: 'Unprocessable Entity',
          errors: errors
        }

        expect(subject.to_h).to eq(expected_hash)
      end
    end

    context 'when the error is a hash' do
      let(:errors) do
        {
          foo: ['the-error']
        }
      end

      it 'formats the errors properly' do
        expected_hash = {
          message: 'Unprocessable Entity',
          errors: [
            foo: ['the-error']
          ]
        }

        expect(subject.to_h).to eq(expected_hash)
      end
    end
  end

  describe '#status' do
    it 'returns the unprocessable entity status code' do
      expect(subject.status).to eq(422)
    end
  end
end
