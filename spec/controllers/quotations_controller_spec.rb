# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuotationsController, type: :controller do
  describe '#create' do
    let(:payload) do
      {
        quotation: {
          user: {
            name: 'the-name',
            email: 'the-email',
            password: 'the-password',
            phone_number: '1111111',
          },
          line_items: %w[line_item_1 line_item_2]
        }
      }
    end

    it 'pefrorms with the correct endpoint' do
      expect(subject).to receive(:perform_with).with(payload)

      post :create, params: payload
    end
  end
end
