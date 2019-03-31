# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_presence_of(:phone_number) }
  it { is_expected.to validate_length_of(:password).is_at_least(8) }
  it { is_expected.to have_many(:quotations) }
end
