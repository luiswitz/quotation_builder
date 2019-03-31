# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  before do
    request.env['HTTP_ACCEPT'] = 'application/json'
  end

  describe '#index' do
    let(:payload) { {} }

    it 'performs with the correct endpoint' do
      expect(subject).to receive(:perform_with).with(payload)

      get :index
    end
  end
end
