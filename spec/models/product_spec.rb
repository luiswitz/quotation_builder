# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  subject do
    described_class.new(
      name: 'the-service',
      kind: :subscription,
      price: 15.00
    )
  end

  let(:expected_product_types) do
    %w[subscription service goods]
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:kind) }
    it { is_expected.to validate_presence_of(:price) }

    it 'validates the definition of PRODUCT_TYPES' do
      expect(described_class.constants).to include(:PRODUCT_TYPES)
    end

    it 'has the correct product types values' do
      expect(described_class::PRODUCT_TYPES).to eq(expected_product_types)
    end

    it 'is not valid with a not listed product type' do
      subject.kind = :something_else

      expect(subject).to_not be_valid
    end
  end
end
