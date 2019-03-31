# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'the-user' }
    email { 'mail@user.com' }
    password { 'securepass' }
    phone_number { '99999999' }
  end
end
