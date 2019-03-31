# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Responses::Base do
  describe '#to_h' do
    it 'raises an error' do
      expect { subject.to_h }.to raise_error 'to_h must be implemented'
    end
  end

  describe '#status' do
    it 'raises an error' do
      expect { subject.status }.to raise_error 'status must be implemented'
    end
  end
end
