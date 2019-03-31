# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Quotation, type: :model do
  let(:quotation) { FactoryBot.build(:quotation, line_items: line_items) }
  let(:line_items) { FactoryBot.build_list(:line_item, 3) }

  before do
    quotation.save
  end

  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to have_many(:line_items) }
  it { is_expected.to validate_presence_of(:line_items) }

  describe '#total' do
    it 'calculates the quotation total' do
      expect(quotation.total).to eq(300.00)
    end
  end
end
