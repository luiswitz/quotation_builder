# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Endpoints::Quotations::CreateEndpoint do
  let(:payload) do
    {
      quotation: {
        user: user,
        line_items: line_items
      }
    }
  end

  let(:user) do
    {
      name: 'the new user',
      email: 'the@newuser.com',
      password: 'thesecurepass',
      phone_number: '99999999'
    }
  end

  let(:product_1) { FactoryBot.create(:product) }
  let(:product_2) { FactoryBot.create(:product) }

  let(:line_items) do
    [
      {
        id: product_1.id,
        name: product_1.name,
        kind: product_1.kind,
        price_factors: { quantity: 10 }
      },
      {
        id: product_2.id,
        name: product_2.name,
        kind: product_2.kind,
        price_factors: { quantity: 10 }
      }
    ]
  end

  let(:perform) { subject.perform(payload) }

  describe '#perform' do
    it 'saves the line_items' do
      perform
      expect(Quotation.last.line_items.count).to eq(2)
    end

    context 'when the user is not registered' do
      it 'it creates a new user' do
        perform
        expect(Quotation.last.user.email).to eq(user[:email])
      end
    end

    context 'when the user is registered' do
      let(:user) do
        {
          name: 'old user',
          email: 'the@existentuser.com',
          password: 'thewrongpass',
          phone_number: '111111111'
        }
      end

      before do
        FactoryBot.create(:user, email: user[:email], password: 'thewrongpass')
      end

      context 'and it has the right credentials' do
        it 'associates the user with the quotation' do
          perform

          expect(Quotation.last.user.email).to eq(user[:email])
        end
      end
    end
  end
end
