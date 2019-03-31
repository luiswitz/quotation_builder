# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Endpoints::Products::IndexEndpoint do
  let(:perform) { subject.perform(payload) }
  let(:payload) { {} }

  let(:products) { FactoryBot.create_list(:product, 10) }

  describe '#perform' do
    before do
      products
    end

    it 'returns a response with all the products' do
      expect(perform).to be_equal_to(Responses::Products::Index.new(products))
    end
  end
end
