# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Responses::Unauthorized do
  describe '#to_h' do
    it 'returns an unauthorized message' do
      expected_hash = {
        message: 'Unauthorized. Must provide credentials'
      }

      expect(subject.to_h).to eq(expected_hash)
    end
  end

  describe '#status' do
    it 'returns the correct status code' do
      expect(subject.status).to eq(401)
    end
  end
end
