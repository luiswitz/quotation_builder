# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Endpoints::BaseEndpoint do
  let(:klass) do
    Class.new(described_class) do
      def initialize(error)
        @error = error
      end

      def perform
        handle_errors { raise @error }
      end
    end
  end

  describe '#handle_errors' do
    it 'handles ArgumentError' do
      error = ArgumentError.new('the message')
      subject = klass.new(error)

      expected_response = Responses::UnprocessableEntity.new(errors: 'the message')

      expect(subject.perform).to be_equal_to(expected_response)
    end

    it 'handles ActiveRecord::RecordInvalid' do
      error = ActiveRecord::RecordInvalid.new
      subject = klass.new(error)

      expected_response = Responses::UnprocessableEntity.new(errors: error.message)

      expect(subject.perform).to be_equal_to(expected_response)
    end

    it 'handles internal error' do
      error = RuntimeError.new

      subject = klass.new(error)

      expected_response = Endpoints::BaseEndpoint::UnhandledError.new(error)

      expect(subject.perform).to be_equal_to(expected_response)
    end
  end
end
